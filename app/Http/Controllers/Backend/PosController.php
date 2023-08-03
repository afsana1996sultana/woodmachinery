<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductStock;
use App\Models\Category;
use App\Models\Brand;
use App\Models\User;
use App\Models\AccountHead;
use App\Models\AccountLedger;
use App\Models\Attribute;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Staff;
use Auth;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class PosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::where('status', 1)->latest()->get();
        // dd($products);
        $staffs = Staff::latest()->get();
        $categories = Category::where('status', 1)->latest()->get();
        $brands = Brand::where('status', 1)->latest()->get();
        $customers = User::where('role', 3)->where('status', 1)->latest()->get();
        //return $products;
        return view('backend.pos.index', compact('products', 'categories', 'brands', 'customers','staffs'));
    }

    public function getProduct($id)
    {
        $idarr = explode("_",$id);
        if(sizeof($idarr)>1){
            $product_stock = ProductStock::findOrFail($idarr[1]);
            $product = Product::findOrFail($idarr[0]);
            
            $product->varient = $product_stock->varient;
            $product->regular_price = $product_stock->price;
            $product->stock_qty = $product_stock->qty;
        }else{
            $product = Product::findOrFail($id);
        }
        
        return json_encode($product);
    }

    public function filter()
    {
        $products = DB::table('products')
            ->leftjoin('product_stocks', 'products.id', '=', 'product_stocks.product_id')
            ->where('status', 1);
            //return json_encode($products);
        if(isset($_GET['search_term'])){
            $products = $products->where('products.name_en', 'like', '%'.$_GET['search_term'].'%');
        }
        if(isset($_GET['category_id'])){
            $products = $products->where('category_id', $_GET['category_id']);
        }
        $products = $products->get();
        return json_encode($products);
    }
    
    public function barcode_search_ajax($id)
    {
        $product_barcode = Product::where('product_code',$id)->first();
        if($product_barcode != null){
            $product_stock = ProductStock::with('product')->where('product_id',$product_barcode->id)->get();
            return json_encode($product_stock);
        }else{
            $product_barcode = ProductStock::where('stock_code',$id)->first();
            $product_stock_barcode = DB::table('products')
            ->join('product_stocks', 'products.id', '=', 'product_stocks.product_id')
            ->where('status', 1)
            ->where('products.id',$product_barcode->product_id)
            ->get();
            return json_encode($product_stock_barcode);
        }
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
        // dd($request->all());
        $product_ids = $request->product_id;
        
        if(!$product_ids || count($product_ids)<=0){
            $notification = array(
                'message' => 'Add at least one product.',
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }
        
        if($request->customer_id == 0 && $request->grand_total != $request->paid_amount){
            $notification = array(
                'message' => 'Walking Customer Not allow Due amount.', 
                'alert-type' => 'error'
            );
            return redirect()->back()->with($notification);
        }

        if($request->payment_method == NULL) {
            $request->payment_method = "cash";
        }
        
        if($request->due_amount == 0.00){
            $payment = $request->payment_status = 1;
        }else{
            $payment = $request->payment_status = 0;
        }

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

        $gust_user = User::where('role', 4)->first();
        //dd($gust_user);
        if($request->customer_id == 0){
            $customer = $gust_user->id;
            $user_email = $gust_user->email;
            $user_phone = $gust_user->phone;
            $user_address = $gust_user->address;
        }else{
            $customer =$request->customer_id;
            $find_user = User::findOrFail($request->customer_id);
            $user_email = $find_user->email;
            $user_phone = $find_user->phone;
            $user_address = $find_user->address;
        }
        
        $order = Order::create([
            'user_id'           => $customer,
            'staff_id'          => $request->staff_id,
            'staff_commission'  => $staff_commission,
            'grand_total'       => $request->grand_total,
            'sub_total'         => $request->subtotal,
            'discount'          => $request->discount,
            'paid_amount'       => $request->paid_amount,
            'due_amount'        => $request->due_amount,
            'payment_method'    => $request->payment_method,
            'payment_status'    => $payment,
            'invoice_no'        => $invoice_no,
            'delivery_status'   => 'pending',
            'phone'             => $user_phone,
            'email'             => $user_email,
            'address'           => $user_address,
            'type'              => 3,
            //'created_by' => Auth::guard('admin')->user()->id,
        ]);
        
        for($i=0; $i<count($product_ids); $i++) {
            $product = Product::find($product_ids[$i]);
            
            OrderDetail::insert([
                'order_id' => $order->id,
                'product_id' => $product_ids[$i],
                'is_varient' => 0,
                'qty' => $request->qty[$i],
                'price' => $request->price[$i],
                'created_at' => Carbon::now(),
            ]);
        
            // return $product;
            
            if($request->pv_id){
                $stock = ProductStock::where('product_id', $product_ids[$i])->where('varient', $request->pv_id[$i] ?? null)->first();
                // dd($stock);
                if($stock){
                    $stock->qty = $stock->qty - $request->qty[$i];
                    $stock->save();
                }
            }
            $product->stock_qty = $product->stock_qty - $request->qty[$i];
            $product->save();
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
        
        $amount = 0;
        
        foreach($order->order_details as $order_detail){
            $product_purchase_price = $order_detail->product->purchase_price;
            $amount+=$order_detail->product->purchase_price;
        }
        //dd($amount);
        $order->pur_sub_total = $amount;
        //dd($order);
        $order->save();
        
        $notification = array(
            'message' => 'Your order has been placed successfully.', 
            'alert-type' => 'success'
        );
        return redirect()->route('print.invoice.download', compact('order'))->with($notification);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    /* ============== Customer Store Ajax ============ */
    public function customerInsert(Request $request)
    {
        // if($request->name == Null){
        //     return response()->json(['error'=> 'Customer Field Required']);
        // }

        $this->validate($request,[
            'name'              => 'required',
            'username'          => ['nullable', 'unique:users'],
            'phone'             => ['required','regex:/(\+){0,1}(88){0,1}01(3|4|5|6|7|8|9)(\d){8}/','min:11','max:15', 'unique:users'],
            'email'             => ['nullable', 'string', 'email', 'max:255', 'unique:users'],
            'address'           => 'required',
            'profile_image'     => 'nullable',
        ]);
        
        $customer = new User();
        if($request->hasfile('profile_image')){
            $image = $request->file('profile_image');
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            Image::make($image)->resize(300,300)->save('upload/user/'.$name_gen);
            $save_url = 'upload/user/'.$name_gen;
        }else{
            $save_url = '';
        }
        $customer->profile_image = $save_url;
        
        $customer->name     = $request->name;
        $customer->username = $request->username;
        $customer->phone    = $request->phone;
        $customer->email    = $request->email;
        $customer->address  = $request->address;
        $customer->role     = 3;
        $customer->status   = 1;
        $customer->password = Hash::make("12345678");
        $customer->save();

        $customers = User::where('role', 3)->orderBy('id','desc')->get();

        return response()->json([ 
            'success'=> 'Customer Inserted Successfully',
            'customers' => $customers,
        ]);
    }
    public function barcode_ajax($id)
    {   
        $product_barcode = Product::where('product_code',$id)->first();
        // dd($product_barcode);
        if($product_barcode != null){
             //dd($product_barcode);
            return json_encode($product_barcode);
        }else{
            $product_stock_barcode = ProductStock::where('stock_code',$id)->first();
            //dd($product_stock_barcode);
            return json_encode($product_stock_barcode);
        }
    }
}