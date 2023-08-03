<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Dealer;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Session;
use Artisan;
use Illuminate\Support\Facades\DB;
use Image;

class DealerAdminController extends Controller
{
    /*=================== Start Dashboard Methoed ===================*/
    public function dashboard(){
        $dealer = Dealer::where('user_id', Auth::guard('dealer')->user()->id)->first();

        $userCount = DB::table('users')
            ->select(DB::raw('count(*) as total_users'))
            ->where('status', 1)
            ->where('role', 3)
            ->first();
        
        $productCount = DB::table('products')
            ->select(DB::raw('count(*) as total_products'))
            ->where('status', 1)
            ->where('approved', 1)
            ->first();

        $categoryCount = DB::table('categories')
            ->select(DB::raw('count(*) as total_categories'))
            ->where('status', 1)
            ->first();

        $brandCount = DB::table('brands')
            ->select(DB::raw('count(*) as total_brands'))
            ->where('status', 1)
            ->first();

        $orderCount = DB::table('orders')
            ->select(DB::raw('count(*) as total_orders, sum(grand_total) as total_sell'))
            ->first();
            
        $lowStockCount = DB::table('product_stocks as s')
            ->leftjoin('products as p', 's.product_id', '=', 'p.id')
            ->select(DB::raw('count(s.id) as total_low_stocks'))
            ->where('s.qty', '<=', 5)
            ->first();

    	// dd($lowStockCount);
    	return view('dealer.index', compact('userCount', 'productCount', 'categoryCount', 'brandCount', 'orderCount', 'lowStockCount'));
    }
    /*=================== End Dashboard Methoed ===================*/

    /*=================== Start Index Login Methoed ===================*/
    public function index()
    {
        if(Auth::check()){
            abort(404);
        }
    	return view('dealer.dealer_login');
    }
    /*=================== End Index Login Methoed ===================*/

    /*=================== Start vendor Login Methoed ===================*/
    public function login(Request $request)
    {
    	$this->validate($request,[
    		'email' =>'required',
    		'password' =>'required'
    	]);
    	if (Auth::guard('dealer')->attempt($request->only('email', 'password'))){
            if(Auth::guard('dealer')->user()->role == "6" || Auth::guard('dealer')->user()->role == "1"){
                if(Auth::guard('dealer')->user()->is_approved == 1){
                    return redirect()->route('dealer.dashboard')->with('success','Dealer Login Successfully.');
                }else{
                    $notification = array(
                        'message' => 'Your account is not activated! Please Contact with Admin.', 
                        'alert-type' => 'error'
                    );
                    return back()->with($notification);
                }
            }else{
                $notification = array(
                    'message' => 'Invaild Email Or Password.', 
                    'alert-type' => 'error'
                );
                return back()->with($notification);
            }
    		
    	}else{
            $notification = array(
                'message' => 'Invaild Email Or Password.', 
                'alert-type' => 'error'
            );
    		return back()->with($notification);
    	}
    	
    } // end method

    /*=================== End vendor Login Methoed ===================*/

    /*=================== Start Logout Methoed ===================*/
    public function dealerLogout(Request $request){
        
    	Auth::guard('dealer')->logout();
        $request->session()->invalidate();

        $request->session()->regenerateToken();
        $notification = array(
            'message' => 'Dealer Logout Successfully.', 
            'alert-type' => 'success'
        );
    	return redirect()->route('dealer.login_form')->with($notification);
    } // end method
    /*=================== End Logout Methoed ===================*/

    /*=================== Start dealerRegister Methoed ===================*/
    public function dealerRegister(){
    	
    	return view('dealer.dealer_register');
    } // end method
    /*=================== End dealerRegister Methoed ===================*/

     /*=================== Start dealerForgotPassword Methoed ===================*/
    public function dealerForgotPassword(){
        
        return view('dealer.dealer_forgot_password');
    } // end method
    /*=================== End dealerForgotPassword Methoed ===================*/

    /*=================== Start dealerRegisterStore Methoed ===================*/
    public function dealerRegisterStore(Request $request){

    	$this->validate($request,[
    		'name' =>'required',
    		'email' =>'required',
    		'password' =>'required',
    		'password_confirmation' =>'required'
    	]);
    	// dd($request->all());
    	User::insert([
    		'name' => $request->name,
    		'email' => $request->email,
    		'password' => Hash::make($request->password),
    		'created_at' => Carbon::now(),
    	]);
    	return redirect()->route('dealer.login_form')->with('success','Dealer Created Successfully.');
    } // end method
    /*=================== End dealerRegisterStore Methoed ===================*/

    /* =============== Start Profile Method ================*/
    public function Profile(){
        $id = Auth::guard('dealer')->user()->id;
        $dealerData = User::find($id);

        // dd($dealerData);
        return view('dealer.dealer_profile_view',compact('dealerData'));

    }// End Method

    /* =============== Start EditProfile Method ================*/
    public function editProfile(){

        $id = Auth::guard('dealer')->user()->id;
        $editData = User::find($id);
        return view('dealer.dealer_profile_edit',compact('editData'));
    }//

     /* =============== Start StoreProfile Method ================*/
    public function storeProfile(Request $request){
        $this->validate($request,[
    		'name'                  =>'required',
    		'password'              =>'required',
    		'password_confirmation' =>'required'
    	]);
        $id = Auth::guard('dealer')->user()->id;
        $data = User::find($id);
        $data->name = $request->name;
        $data->phone = $request->phone;
        $data->address = $request->address;

        if ($request->file('profile_image')) {
           $file = $request->file('profile_image');

           $filename = date('YmdHi').$file->getClientOriginalName();
           $file->move(public_path('upload/dealer_images'),$filename);
           $data['profile_image'] = $filename;
        }
        $data->save();

        Session::flash('success','Dealer Profile Updated Successfully');

        return redirect()->route('dealer.profile');

    }// End Method

    /* =============== Start ChangePassword Method ================*/
    public function changePassword(){

        return view('dealer.dealer_change_password');

    }// 

    /* =============== Start UpdatePassword Method ================*/
    public function updatePassword(Request $request){

        $validateData = $request->validate([
            'oldpassword' => 'required',
            'newpassword' => 'required',
            'confirm_password' => 'required|same:newpassword',

        ]);

        $hashedPassword = Auth::guard('dealer')->user()->password;

        // dd($hashedPassword);
        if (Hash::check($request->oldpassword,$hashedPassword )) {
            $id = Auth::guard('dealer')->user()->id;
            $dealer = User::find($id);
            $dealer->password = bcrypt($request->newpassword);
            $dealer->save();

            Session::flash('success','Password Updated Successfully');
            return redirect()->back();
        }else{
            Session::flash('error','Old password is not match');
            return redirect()->back();
        }

    }// End Method

    /* =============== Start clearCache Method ================*/
    function clearCache(Request $request){
        Artisan::call('optimize:clear');
        Session::flash('success','Cache cleared successfully.');
        return redirect()->back();
    } // end method

    /* =============== End clearCache Method ================*/
}
