<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\AccountLedger;
use Illuminate\Http\Request;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\User;
use App\Models\Address;
use App\Models\DealerRequestProduct;
use App\Models\District;
use App\Models\Upazilla;
use App\Models\Shipping;
use App\Models\Product;
use App\Models\ProductStock;
use Session;
use PDF;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $date = $request->date;
        $delivery_status = null;
        $payment_status = null;

        if($request->delivery_status != null && $request->payment_status != null && $date != null){

            $orders = Order::where('created_at', '>=', date('Y-m-d', strtotime(explode(" - ", $date)[0])))->where('created_at', '<=', date('Y-m-d', strtotime(explode(" - ", $date)[1])))->where('delivery_status', $request->delivery_status)->where('payment_status', $request->payment_status);

            $delivery_status = $request->delivery_status;
            $payment_status = $request->payment_status;

        }else if($request->delivery_status == null && $request->payment_status == null && $date == null){
            $orders = Order::orderBy('id', 'desc');
        }else{
            if($request->delivery_status == null){
                if($request->payment_status != null && $date != null){
                    $orders = Order::where('created_at', '>=', date('Y-m-d', strtotime(explode(" - ", $date)[0])))->where('created_at', '<=', date('Y-m-d', strtotime(explode(" - ", $date)[1])))->where('payment_status', $request->payment_status);
                    $payment_status = $request->payment_status;
                }else if($request->payment_status == null && $date != null){
                    $orders = Order::where('created_at', '>=', date('Y-m-d', strtotime(explode(" - ", $date)[0])))->where('created_at', '<=', date('Y-m-d', strtotime(explode(" - ", $date)[1])));
                }else{
                    $orders = Order::where('payment_status', $request->payment_status);
                    $payment_status = $request->payment_status;
                }
            }else if($request->payment_status == null){
                if($request->delivery_status != null && $date != null){
                    $orders = Order::where('created_at', '>=', date('Y-m-d', strtotime(explode(" - ", $date)[0])))->where('created_at', '<=', date('Y-m-d', strtotime(explode(" - ", $date)[1])))->where('delivery_status', $request->delivery_status);
                    $delivery_status = $request->delivery_status;
                }else if($request->delivery_status == null && $date != null){
                    $orders = Order::where('created_at', '>=', date('Y-m-d', strtotime(explode(" - ", $date)[0])))->where('created_at', '<=', date('Y-m-d', strtotime(explode(" - ", $date)[1])));
                }else{
                    $orders = Order::where('delivery_status', $request->delivery_status);
                    $delivery_status = $request->delivery_status;
                }
            }else if($request->date == null){
                if($request->delivery_status != null && $request->payment_status != null){
                    $orders = Order::where('delivery_status', $request->delivery_status)->where('payment_status', $request->payment_status);
                    $delivery_status = $request->delivery_status;
                    $payment_status = $request->payment_status;
                }else if($request->delivery_status == null && $request->payment_status != null){
                    $orders = Order::where('payment_status', $request->payment_status);
                    $payment_status = $request->payment_status;
                }else{
                    $orders = Order::where('delivery_status', $request->delivery_status);
                    $delivery_status = $request->delivery_status;
                }
            }
        }

        //dd($request);

        $orders = $orders->where('type','!=', 4)->paginate(15);
        return view('backend.sales.all_orders.index', compact('orders', 'delivery_status', 'date','payment_status'));
    }

    public function dealerOrderIndex(){
        $orders = Order::where('type', 4)->get();
        return view('backend.sales.all_orders.dealer_index', compact('orders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }
    
    public function dealer_order(Request $request)
    {

        // dd($request->all());
        $products = $request->input('products');
        $subtotals = [];
        $variantId = [];
        foreach ($products as $product) {
            $values = explode('|', $product);

            $productId = $values[1];
            $price = $values[2];
            $quantity = $values[3];
            $subtotal = $values[4];
            $subtotals[] = $subtotal;
            $variantIdValue = isset($values[5]) ? $values[5] : null;
            $variantId[] = $variantIdValue;
        }
        $grandTotal = array_sum($subtotals);

        if(!$products || count($products)<=0){
            $notification = array(
                'message' => 'Add at least one product.', 
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
        if($request->payment_method == NULL) {
            $request->payment_method = "cash";
        }
        
        // if($request->due_amount == 0.00 || $request->due_amount != null){
        //     $payment = $request->payment_status = 1;
        // }else{
        //     $payment = $request->payment_status = 0;
        // }


        $invoice_data = Order::orderBy('id','desc')->first();
        if($invoice_data){
            $lastId = $invoice_data->id;
            // $idd = str_replace("E-", "", $lastId);
            $id = str_pad($lastId + 1, 7, 0, STR_PAD_LEFT);
            $invoice_no = $id;
        }else{
            $invoice_no = "0000001";
        }
        if($request->staff_id){
            $staff = Staff::where('id', $request->staff_id)->first();
            $staff_commission = (($request->grand_total/100) * $staff->user->commission);
        }else{
            $staff_commission = 0;
        }
        
        $customer =$request->dealer_id;
        $find_user = User::findOrFail($request->dealer_id);
        $user_name = $find_user->name;
        $user_email = $find_user->email;
        $user_phone = $find_user->phone;
        $user_address = $find_user->address;

        $order = Order::create([
            'user_id'           => $customer,
            'staff_id'          => 0,
            'staff_commission'  => $staff_commission,
            'grand_total'       => $grandTotal,
            'sub_total'         => $grandTotal,
            'payment_method'    => $request->payment_method,
            'payment_status'    => 0,
            'invoice_no'        => $invoice_no,
            'delivery_status'   => 'pending',
            'name'              => $user_name,
            'phone'             => $user_phone,
            'email'             => $user_email,
            'address'           => $user_address,
            'type'              => 4,
            'created_by' => Auth::guard('admin')->user()->id,
        ]);

        for ($i = 0; $i < count($products); $i++) {
            $productData = explode('|', $products[$i]);
        
            $dealer_request_product = $productData[0];
            $productId = $productData[1];
            $price = $productData[2];
            $quantity = $productData[3];
            $subtotal = $productData[4];
        
            if(isset($productData[5])) {
                $variantIdValue = $productData[5];
            }else{
                $variantIdValue = null;
            }
        
            OrderDetail::create([
                'order_id'          => $order->id, 
                'product_id'        => $productId,
                'is_varient'        => $variantIdValue !== null ? 1 : 0,
                'product_stock_id'  => $variantIdValue,
                'qty'               => $quantity,
                'price'             => $price,
                'created_at'        => now(),
            ]);
            $dealer_request_product = DealerRequestProduct::where('dealer_request_id',$request->dealer_request_id)->where('id',$dealer_request_product)->update([
                'request_status' => 1,
                'delivery_status' => 'processing',
            ]);

        }

        $ledger_balance = get_account_balance() + $order->grand_total;
        
        $ledger = AccountLedger::create([
            'account_head_id' => 2,
            'particulars' => 'Order ID: '.$order->id,
            'credit' => $order->grand_total,
            'order_id' => $order->id,
            'balance' => $ledger_balance,
            'type' => 2,
        ]);

        $notification = array(
            'message' => 'Your order has been placed successfully.', 
            'alert-type' => 'success'
        );
        return redirect()->route('print.invoice.download', compact('order'))->with($notification);
    }

    public function dealer_menuimg_print($id,$dealer)
    {
        $dealer_request_product = DealerRequestProduct::findOrFail($id);
        $product_stock = ProductStock::findOrFail($dealer_request_product->product_stock_id);
        $product = Product::where('id',$dealer_request_product->product_id)->first();
        $dealer = User::findOrFail($dealer);
        return view('backend.sales.dealer_manufac_print',compact('dealer_request_product','product','dealer','product_stock'));
    }
    public function dealer_order_menuimg_print($id,$dealer)
    {
        $dealer_request_product = OrderDetail::findOrFail($id);
        $product_stock = ProductStock::findOrFail($dealer_request_product->product_stock_id);
        $product = Product::where('id',$dealer_request_product->product_id)->first();
        $dealer = User::findOrFail($dealer);
        return view('backend.sales.dealer_manufac_print',compact('dealer_request_product','product','dealer','product_stock'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        $order = Order::findOrFail($id);
        $shippings = Shipping::where('status', 1)->get();
        
        return view('backend.sales.all_orders.show', compact('order', 'shippings'));
    }

    public function dealerShow($id)
    {
        $order = Order::findOrFail($id);
        return view('backend.sales.all_orders.dealer_show', compact('order'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {   
        $this->validate($request,[
            'payment_method' => 'required',
        ]);
        $order = Order::findOrFail($id);

        $order->division_id = $request->division_id;
        $order->district_id = $request->district_id;
        $order->upazilla_id = $request->upazilla_id;
        $order->payment_method = $request->payment_method;

        $discount_total = ($order->sub_total - $request->discount);
        $total_ammount = ($discount_total + $request->shipping_charge);

        Order::where('id', $id)->update([
            'shipping_charge'   => $request->shipping_charge,
            'discount'          => $request->discount,
            'grand_total'       => $total_ammount,
        ]);

        $order->save();

        Session::flash('success','Admin Orders Information Updated Successfully');
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::findOrFail($id);

        $order->delete();

        $notification = array(
            'message' => 'Order Deleted Successfully.', 
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }


    /*================= Start update_payment_status Methoed ================*/
    public function update_payment_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);

        $order->payment_status = $request->status;
        $order->save();

        // dd($order);

        return response()->json(['success'=> 'Payment status has been updated']);

    }

    /*================= Start update_delivery_status Methoed ================*/
    public function update_delivery_status(Request $request)
    {
        $order = Order::findOrFail($request->order_id);
        $order->delivery_status = $request->status;
        $order->save();

        return response()->json(['success'=> 'Delivery status has been updated']);

    }



    /*================= Start admin_user_update Methoed ================*/
    public function admin_user_update(Request $request, $id)
    {
        $user = Order::where('id',$id)->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
        ]);

        // dd($user);

        Session::flash('success','Customer Information Updated Successfully');
        return redirect()->back();
    }

    /* ============= Start getdivision Method ============== */
    public function getdivision($division_id){
        $division = District::where('division_id', $division_id)->orderBy('district_name_en','ASC')->get();

        return json_encode($division);
    }
    /* ============= End getdivision Method ============== */

    /* ============= Start getupazilla Method ============== */
    public function getupazilla($district_id){
        $upazilla = Upazilla::where('district_id', $district_id)->orderBy('name_en','ASC')->get();

        return json_encode($upazilla);
    }
    /* ============= End getupazilla Method ============== */

    /* ============= Start invoice_download Method ============== */
    // public function invoice_download($id){
    //     $order = Order::findOrFail($id);

    //     $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4')->setOptions([
    //             'tempDir' => public_path(),
    //             'chroot' => public_path(),
    //     ]);
    //     return $pdf->download('invoice.pdf');
    // } // end method

    /* ============= Start invoice_download Method ============== */
    public function invoice_download($id){
        $order = Order::findOrFail($id);
        //dd(app('url')->asset('upload/abc.png'));
        $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4');
        return $pdf->download('invoice.pdf');
    } // end method

    public function dealerInvoiceDownload($id){
        $order = Order::findOrFail($id);
        //dd(app('url')->asset('upload/abc.png'));
        $pdf = PDF::loadView('backend.invoices.dealer_invoice',compact('order'))->setPaper('a4');
        return $pdf->download('invoice.pdf');
    } // end method

    /* ============= End invoice_download Method ============== */
     public function invoice_print_download($id){
        //dd($id);
        $order = Order::findOrFail($id);
        //dd(app('url')->asset('upload/abc.png'));
        // $pdf = PDF::loadView('backend.invoices.invoice',compact('order'))->setPaper('a4');
        // dd($pdf);
        return view('backend.invoices.invoice_print', compact('order'));
        // return $pdf->loadView('invoice.pdf');
    } // end method

}
