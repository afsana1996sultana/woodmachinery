<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\ProductStock;
use App\Models\Vendor;
use App\Models\Order;
use Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_by =null;
        $products = Product::orderBy('created_at', 'desc');
        $categories = Category::where('id',$request->category_id)->select('id','name_en')->first();

        if(Auth::guard('admin')->user()->role == '2'){
            $products = Product::orderBy('created_at', 'desc')->where('vendor_id', Auth::guard('admin')->user()->id);
            if ($request->has('category_id')){
                $sort_by = $request->category_id;
                $products = $products->where('category_id', $sort_by);
            }
            $vendor = Vendor::where('user_id', Auth::guard('admin')->user()->id)->first();
            if($vendor){
                $products = Product::where('vendor_id', $vendor->id)->latest()->paginate(20);
            }
        }else{
            if ($request->has('category_id')){
                $sort_by = $request->category_id;
                $products = $products->where('category_id', $sort_by, $categories);
            }
        }
        
        $products = $products->paginate(15);
        return view('backend.reports.index', compact('products','categories'));
    }
    
    
    public function profitReport(){
        $currentMonth = Carbon::now()->month;
        $order_today_total  = Order::whereDay('created_at', date('d'))->sum('grand_total');
        $order_today_pur  = Order::whereDay('created_at', date('d'))->sum('pur_sub_total');
        $order_today_shipping  = Order::whereDay('created_at', date('d'))->sum('shipping_charge');
        $today_profit = (($order_today_total - $order_today_shipping) - $order_today_pur);
        
        $order_monthly_total = Order::whereMonth('created_at', $currentMonth)->sum('grand_total');
        $order_monthly_pur = Order::whereMonth('created_at', $currentMonth)->sum('pur_sub_total');
        $order_monthly_shipping = Order::whereMonth('created_at', $currentMonth)->sum('shipping_charge');
        $monthly_profit = (($order_monthly_total - $order_monthly_shipping) - $order_monthly_pur);
        
        $order_yearly_total  = Order::whereYear('created_at', date('Y-m-d'))->sum('grand_total');
        $order_yearly_pur  = Order::whereYear('created_at', date('Y-m-d'))->sum('pur_sub_total');
        $order_yearly_shipping  = Order::whereYear('created_at', date('Y-m-d'))->sum('shipping_charge');
        $yearly_profit = (($order_monthly_total -$order_yearly_shipping) - $order_monthly_pur);
        
        return view('backend.reports.profit_report', compact('today_profit', 'monthly_profit', 'yearly_profit',));
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
}