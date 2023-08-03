@extends('admin.admin_master')
@section('admin')
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title">Dealers Edit</h2>
        <div class="">
            <a href="{{ route('dealer.index') }}" class="btn btn-primary"><i class="material-icons md-plus"></i> Dealer List</a>
        </div>
    </div> 
    <div class="row justify-content-center">
    	<div class="col-sm-10">
    		<div class="card">
		        <div class="card-body">
					<form method="post" action="{{ route('dealer.update',$dealer->id) }}" enctype="multipart/form-data">
						@csrf
						@method('PUT')
						<div class="row">
							<div class="col-md-6 mb-4">
								<label for="name" class="col-form-label col-md-4" style="font-weight: bold;"> Name : <span class="text-danger">*</span></label>
								<input class="form-control" id="name" type="text" name="name" placeholder="Write Dealer name" value="{{ $dealer->user->name ?? '' }}">
								@error('name')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>

							<div class="col-md-6 mb-4">
							<label for="phone" class="col-form-label col-md-4" style="font-weight: bold;"> Phone : <span class="text-danger">*</span></label>
								<input class="form-control" id="phone" type="text" name="phone" placeholder="Write Dealer phone number" value="{{ $dealer->user->phone ?? '' }}">
								@error('phone')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>

							<div class="col-md-6 mb-4">
							<label for="email" class="col-form-label col-md-4" style="font-weight: bold;"> Email : <span class="text-danger">*</span></label>
								<input class="form-control" id="email" type="email" name="email" placeholder="Write Dealer email address" value="{{ $dealer->user->email ?? '' }}">
								@error('email')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>

							<div class="col-md-6 mb-4">
								<label for="address" class="col-form-label col-md-4" style="font-weight: bold;">Address : <span class="text-danger">*</span></label>
								<input class="form-control" id="address" type="text" name="address" placeholder="Write Dealer address" value="{{ $dealer->user->address ?? '' }}">
								@error('address')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>
							<div class="col-md-6 mb-4">
								<label for="bank_name" class="col-form-label col-md-4" style="font-weight: bold;">Bank Name :</label>
								<input class="form-control" id="bank_name" type="text" name="bank_name" placeholder="Write Dealer bank name" value="{{ $dealer->bank_name }}">
							</div>
							<div class="col-md-6 mb-4">
								<label for="bank_account" class="col-form-label col-md-4" style="font-weight: bold;">Bank Account No:</label>
								<input class="form-control" id="bank_account" type="text" name="bank_account" placeholder="Write Dealer bank name" value="{{ $dealer->bank_account }}">
							</div>

							<div class="col-md-6 mb-4">
								<label for="description" class="col-form-label col-md-4" style="font-weight: bold;">Description :</label>
								<textarea name="description" id="description" cols="5" placeholder="Write Dealer description" class="form-control ">{{ $dealer->description }}</textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="mb-4">
									 <label for="image" class="col-form-label" style="font-weight: bold;">Profile: <span class="text-danger">*</span></label>
									<input name="profile_image" class="form-control" type="file" id="image">
								</div>
								<div class="mb-4">
									 <img id="showImage" class="rounded avatar-lg" src="{{ (!empty($dealer->profile_image))? url($dealer->profile_image):url('upload/no_image.jpg') }}" alt="Card image cap" width="100px" height="80px;">
								</div>
							</div>

							<div class="col-md-6">
								<div class="mb-4">
									<label for="image2" class="col-form-label" style="font-weight: bold;">Bank Information: <span class="text-danger">*</span></label>
									<input name="bank_account_img" class="form-control" type="file" id="image2">
								</div>
								<div class="mb-4">
									<img id="showImage2" class="rounded avatar-lg" src="{{ (!empty($dealer->bank_account_img))? url($dealer->bank_account_img):url('upload/no_image.jpg') }}" alt="Card image cap" width="100px" height="80px;">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="mb-4">
									<label for="image3" class="col-form-label" style="font-weight: bold;">Nid Card:<span class="text-danger">*</span></label>
									<input name="nid" class="form-control" type="file" id="image3">
								</div>
								<div class="mb-4">
									<img id="showImage3" class="rounded avatar-lg" src="{{ (!empty($dealer->nid))? url($dealer->nid):url('upload/no_image.jpg') }}" alt="Card image cap" width="100px" height="80px;">
								</div>
							</div>

							<div class="col-md-6">
								<div class="mb-4">
									<label for="image4" class="col-form-label" style="font-weight: bold;">Trade license:<span class="text-danger">*</span></label>
									<input name="trade_license" class="form-control" type="file" id="image4">
								</div>
								<div class="mb-4">
									<img id="showImage4" class="rounded avatar-lg" src="{{ (!empty($dealer->trade_license))? url($dealer->trade_license):url('upload/no_image.jpg') }}" alt="Card image cap" width="100px" height="80px;">
								</div>
							</div>
						</div>

						<div class="mb-4">
							<div class="custom-control custom-switch">
								<input type="checkbox" class="form-check-input me-2 cursor" {{ $dealer->status == 1 ? 'checked': '' }} value="1" {{ $dealer->user->is_approved == 0 ? 'disabled': '' }}>
								<label class="form-check-label cursor" for="status">Status</label>
							</div>
						</div>

						<div class="row mb-4 justify-content-sm-end">
							<div class="col-lg-3 col-md-4 col-sm-5 col-6">
								<input type="submit" class="btn btn-primary" value="Update">
							</div>
						</div>
					</form>
		        </div>
		        <!-- card body .// -->
		    </div>
		    <!-- card .// -->
			<div class="card">
		        <div class="card-body">
					<form method="post" action="{{ route('admin.dealer.password.update',$dealer->user->id) }}" enctype="multipart/form-data">
						@csrf
						<div class="mb-4 row">
							<div class="col-md-12 mb-4">
								<label for="old_password" class="col-form-label col-md-4" style="font-weight: bold;">Old Password : <span class="text-danger">*</span></label>
								<input class="form-control" id="old_password" type="password" name="old_password" placeholder="Write dealer Old Password">
								@error('old_password')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>
							<div class="col-md-6 mb-4">
								<label for="password" class="col-form-label col-md-4" style="font-weight: bold;">New Password : <span class="text-danger">*</span></label>
								<input class="form-control" id="password" type="password" name="password" placeholder="Write dealer New Password">
								@error('password')
									<p class="text-danger">{{$message}}</p>
								@enderror
							</div>
							<div class="col-md-6 mb-4">
								<label class="col-form-label col-md-4" style="font-weight: bold;" for="rtpassword">Confirm Password: <span class="text-danger">*</span></label>
								<input class="form-control" placeholder="Confirm Password" type="password" name="password_confirmation" id="rtpassword" />
								@error('password_confirmation')
									<span class="text-danger">{{ $message }}</span>
								@enderror
							</div>
						</div>
						<div class="row mb-4 justify-content-sm-end">
							<div class="col-lg-3 col-md-4 col-sm-5 col-6">
								<input type="submit" class="btn btn-primary" value="Update">
							</div>
						</div>
					</form>
				</div>
			</div>
    	</div>
    </div>
</section>
@endsection

@push('footer-script')
<!-- Shop Cover Photo Show -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#image2').change(function(e){
                var reader = new FileReader();
                reader.onload = function(e){
                    $('#showImage2').attr('src',e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>
    <!-- Nid Card Show -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#image3').change(function(e){
                var reader = new FileReader();
                reader.onload = function(e){
                    $('#showImage3').attr('src',e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>
    <!-- Trade license Show -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#image4').change(function(e){
                var reader = new FileReader();
                reader.onload = function(e){
                    $('#showImage4').attr('src',e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>
@endpush