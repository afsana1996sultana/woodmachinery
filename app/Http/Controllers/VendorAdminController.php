<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Vendor;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Session;
use Artisan;
use Illuminate\Support\Facades\DB;
use Image;

class VendorAdminController extends Controller
{
    /*=================== Start Index Login Methoed ===================*/
    public function index(){

        if(Auth::check()){
            abort(404);
        }

    	return view('vendor.vendor_login');
    } // end method

    /*=================== End Index Login Methoed ===================*/

    /*=================== Start Dashboard Methoed ===================*/
    public function dashboard(){
        $vendor = Vendor::where('user_id', Auth::guard('vendor')->user()->id)->first();

        $userCount = DB::table('users')
            ->select(DB::raw('count(*) as total_users'))
            ->where('status', 1)
            ->where('role', 3)
            ->first();
        
        $productCount = DB::table('products')
            ->select(DB::raw('count(*) as total_products'))
            ->where('vendor_id', Auth::guard('vendor')->user()->id)
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
            ->where('p.vendor_id', Auth::guard('vendor')->user()->id)
            ->where('s.qty', '<=', 5)
            ->first();

    	// dd($lowStockCount);
    	return view('vendor.index', compact('userCount', 'productCount', 'categoryCount', 'brandCount', 'orderCount', 'lowStockCount'));
    } // end method

    /*=================== End Dashboard Methoed ===================*/

    /*=================== Start vendor Login Methoed ===================*/
    public function login(Request $request){

    	$this->validate($request,[
    		'email' =>'required',
    		'password' =>'required'
    	]);

    	// dd($request->all());
    	$check = $request->all();
    	if(Auth::guard('vendor')->attempt(['email' => $check['email'], 'password'=> $check['password'] ])){

            if(Auth::guard('vendor')->user()->role == "2" || Auth::guard('vendor')->user()->role == "1"){
                if(Auth::guard('vendor')->user()->is_approved == 1){
                    return redirect()->route('vendor.dashboard')->with('success','Vendor Login Successfully.');
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
    public function vendorLogout(Request $request){
        
    	Auth::guard('vendor')->logout();
        $request->session()->invalidate();

        $request->session()->regenerateToken();
        $notification = array(
            'message' => 'Vendor Logout Successfully.', 
            'alert-type' => 'success'
        );
    	return redirect()->route('vendor.login_form')->with($notification);
    } // end method
    /*=================== End Logout Methoed ===================*/

    /*=================== Start vendorRegister Methoed ===================*/
    public function vendorRegister(){
    	
    	return view('vendor.vendor_register');
    } // end method
    /*=================== End vendorRegister Methoed ===================*/

     /*=================== Start vendorForgotPassword Methoed ===================*/
    public function vendorForgotPassword(){
        
        return view('vendor.vendor_forgot_password');
    } // end method
    /*=================== End vendorForgotPassword Methoed ===================*/

    /*=================== Start vendorRegisterStore Methoed ===================*/
    public function vendorRegisterStore(Request $request){

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
    	return redirect()->route('vendor.login_form')->with('success','Vendor Created Successfully.');
    } // end method
    /*=================== End vendorRegisterStore Methoed ===================*/

    /* =============== Start Profile Method ================*/
    public function Profile(){
        $id = Auth::guard('vendor')->user()->id;
        $vendorData = User::find($id);

        // dd($vendorData);
        return view('vendor.vendor_profile_view',compact('vendorData'));

    }// End Method

    /* =============== Start EditProfile Method ================*/
    public function editProfile(){

        $id = Auth::guard('vendor')->user()->id;
        $editData = User::find($id);
        return view('vendor.vendor_profile_edit',compact('editData'));
    }//

     /* =============== Start StoreProfile Method ================*/
    public function storeProfile(Request $request){
        $id = Auth::guard('vendor')->user()->id;
        $data = User::find($id);
        $data->name = $request->name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;

        if ($request->file('profile_image')) {
           $file = $request->file('profile_image');

           $filename = date('YmdHi').$file->getClientOriginalName();
           $file->move(public_path('upload/vendor_images'),$filename);
           $data['profile_image'] = $filename;
        }
        $data->save();

        Session::flash('success','Vendor Profile Updated Successfully');

        return redirect()->route('vendor.profile');

    }// End Method

    /* =============== Start ChangePassword Method ================*/
    public function changePassword(){

        return view('vendor.vendor_change_password');

    }// 

    /* =============== Start UpdatePassword Method ================*/
    public function updatePassword(Request $request){

        $validateData = $request->validate([
            'oldpassword' => 'required',
            'newpassword' => 'required',
            'confirm_password' => 'required|same:newpassword',

        ]);

        $hashedPassword = Auth::guard('vendor')->user()->password;

        // dd($hashedPassword);
        if (Hash::check($request->oldpassword,$hashedPassword )) {
            $id = Auth::guard('vendor')->user()->id;
            $vendor = User::find($id);
            $vendor->password = bcrypt($request->newpassword);
            $vendor->save();

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
