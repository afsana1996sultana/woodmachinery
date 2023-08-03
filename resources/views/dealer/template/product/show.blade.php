@extends('dealer.dealer_master')
@section('dealer')
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title">Show Product</h2>
        <div class="">
            <a href="{{ route('dealer.product.all') }}" class="btn btn-primary"><i class="material-icons md-plus"></i> Product List</a>
        </div>
    </div> 
	<div class="row">
		{{-- @if ($errors->any())
		    <div class="alert alert-danger">
		        <ul>
		            @foreach ($errors->all() as $error)
		                <li>{{ $error }}</li>
		            @endforeach
		        </ul>
		    </div>
		@endif --}}
        <div class="col-md-10 mx-auto">
				<div class="card">
					<div class="card-header">
						<h3>Basic Info</h3>
					</div>
		        	<div class="card-body">
		        		<div class="row">
		                	<div class="col-md-6 mb-4">
		                        <label for="product_name_en" class="col-form-label" style="font-weight: bold;">Product Name (En):</label>
		                        <input class="form-control" id="product_name_en" type="text" name="name_en" placeholder="Write product name english" value="{{ $product->name_en }}" readonly>
		                    </div>
		                    <div class="col-md-6 mb-4">
	                           	<label for="product_name_bn" class="col-form-label" style="font-weight: bold;">Product Name (Bn):</label>
	                           	<input class="form-control" id="product_name_bn" type="text" name="name_bn" placeholder="Write product name bangla" value="{{ $product->name_bn }}" readonly>
		                    </div>
		        		</div>

		        		<div class="row">
		        			<div class="col-md-6 mb-4 d-none">
	                          <label for="product_code" class="col-form-label" style="font-weight: bold;">Product Code:</label>
	                            <input class="form-control" id="product_code" type="text" name="product_code" placeholder="Write product code" value="{{ $product->product_code }}" readonly>
	                        </div>
							<div class="col-md-6 mb-4">
								<label for="product_category" class="col-form-label" style="font-weight: bold;">Category:</label>
								@php
									$selectedCategory = $product->category_id;
								@endphp
								<div class="custom_select">
									<select class="form-control select-active w-100 form-select select-nice" name="category_id" id="product_category" disabled>
										@foreach ($categories as $category)
											<option value="{{ $category->id }}" @if($category->id==$selectedCategory) selected  @endif>{{ $category->name_en }}</option>
											@foreach ($category->childrenCategories as $childCategory)
												@include('dealer.template.include.child_category', ['child_category' => $childCategory])
											@endforeach
										@endforeach
									</select>
								</div>
							</div>
							<div class="col-md-6 mb-4">
	                           <label for="brand_id" class="col-form-label" style="font-weight: bold;">Brand:</label>
				                <div class="custom_select">
                                    <select class="form-control select-active w-100 form-select select-nice" name="brand_id" id="brand_id" disabled>
                                    	<option value="">--Select Brand--</option>
		                                @foreach ($brands as $brand)
		                                    <option value="{{ $brand->id }}" {{ $brand->id == $product->brand_id ? 'selected' : '' }}>{{ $brand->name_en }}</option>
		                                @endforeach
                                    </select>
                                </div>
	                        </div>
							
	                        <div class="col-md-6 mb-4">
	                         	<label for="supplier_id" class="col-form-label" style="font-weight: bold;">Supplier:</label>
				                <div class="custom_select">
                                    <select class="form-control select-active w-100 form-select select-nice" name="supplier_id" id="supplier_id" disabled>
                                    	<option value="">--Select Supplier--</option>
					                	@foreach($suppliers as $supplier)
					                		<option value="{{ $supplier->id }}" @if($product->supplier_id == $supplier->id) selected @endif>{{ $supplier->name ?? 'Null' }}</option>
					               		@endforeach
                                    </select>
                                </div>
				            </div>
							<div class="col-md-6 mb-4">
								<label for="unit_id" class="col-form-label" style="font-weight: bold;">Unit Type:</label>
								<div class="custom_select">
									<select class="form-control select-active w-100 form-select select-nice" name="unit_id" id="unit_id" disabled>
										<option disabled hidden {{old('unit_id') ? '' : 'selected'}} readonly value="">--Select Unit Type--</option>
										@foreach($units as $unit)
											<option value="{{ $unit->id }}" @if($product->unit_id == $unit->id) selected @endif>{{ $unit->name }}</option>
										@endforeach
									</select>
								</div>
						   	</div>
							<div class="col-md-6 mb-4">
								<label for="unit_weight" class="col-form-label" style="font-weight: bold;">Unit Weight (e.g. 10 mg, 1 Carton, 15 Pcs)</label>
								<input class="form-control" id="unit_weight" type="number" name="unit_weight" placeholder="Write unit weight" value="{{ $product->unit_weight }}" readonly>
						   	</div>
			        		{{-- <div class="col-md-6 mb-4">
	                         	<label for="campaing_id" class="col-form-label" style="font-weight: bold;">Campaing:</label>
				                <div class="custom_select">
                                    <select class="form-control select-active w-100 form-select select-nice" name="campaing_id" id="campaing_id">
                                    	<option selected="">Select Campaing</option>
                                    </select>
                                </div>
	                        </div> --}}
	                        <div class="col-md-6 mb-4">
		                        <label for="product_name_en" class="col-form-label" style="font-weight: bold;">Tags:</label>
			                    <input class="form-control tags-input" type="text"name="tags[]" value="{{ $product->tags }}" placeholder="Type and hit enter to add a tag" readonly>
			                    <small class="text-muted d-block">This is used for search. </small>
		                    </div>
		        		</div>
		        		<!-- row //-->
		        	</div>
		        	<!-- card body .// -->
			    </div>
			    <!-- card .// --> 

			    <div class="card">
					<div class="card-header" style="background-color: #fff !important;">
						<h3 style="color: #4f5d77 !important">Product Variation</h3>
					</div>
		        	<div class="card-body">
		        		<div class="row">
	                        <!-- Variation Start -->
	                        <div class="col-md-6 mb-4">
				                <div class="custom_select cit-multi-select">
				                	<label for="choice_attributes" class="col-form-label" style="font-weight: bold;">Attributes:</label>
                                    <select class="form-control select-active w-100 form-select select-nice" name="choice_attributes[]" id="choice_attributes" multiple="multiple" data-placeholder="Choose Attributes" disabled>
					                	@foreach($attributes as $attribute)
					                		@if($product->is_varient==1 && count(json_decode($product->attributes)) > 0)
					                			<option @if(in_array($attribute->id, json_decode($product->attributes))) selected @endif value="{{ $attribute->id }}">{{ $attribute->name }}</option>
					                		@else
					                			<option value="{{ $attribute->id }}">{{ $attribute->name }}</option>
					                		@endif
					               		@endforeach
                                    </select>
                                </div>
	                        </div>

	                        <div class="col-md-12 mb-4">
	                        	<div class="customer_choice_options" id="customer_choice_options">
	                        		<div class="mb-4">
										@foreach ($attributes as $attribute)
											@if($product->is_varient==1 && count(json_decode($product->attributes)) > 0)

												@if(in_array($attribute->id, json_decode($product->attributes)))
													@php
														$attr_values = array();
														foreach(json_decode($product->attribute_values) as $attribute_value){
															if($attribute_value->attribute_id == $attribute->id){
																$attr_values = $attribute_value->values;
															}
														}	
													@endphp
													<div class="custom_select cit-multi-select mb-4">
														<label for="choice_attributes" class="col-form-label" style="font-weight: bold;">{{$attribute->name}} :</label>
												    	<select class="form-control form-select js-example-basic-multiple" name="choice_options{{$attribute->id}}[]" id="choice_options{{$attribute->id}}" onchange="makeCombinationTable(this)" multiple data-placeholder="Nothing selected" disabled>
												        	@foreach($attribute->attribute_values as $value)
												        		<option @if(in_array($value->value, $attr_values)) selected @endif value="{{ $value->value }}">{{ $value->value }}</option>
												       		@endforeach
												        </select>
													</div>
												@endif
											@endif
										@endforeach
									</div>

									<script>
										$(document).ready(function() {
									    	$('.js-example-basic-multiple').select2();
										});
									</script>
	                        	</div>
	                        </div>
	                        <!-- Variation End -->
		        		</div>
		        	</div>
		        </div>
		        <!-- card //-->

		        <div class="card">
					<div class="card-header" style="background-color: #fff !important;">
						<h3 style="color: #4f5d77 !important">Pricing</h3>
					</div>
		        	<div class="card-body">
		        		<div class="row">
		                    <div class="col-md-6 mb-4">
	                          	<label for="wholesell_price" class="col-form-label" style="font-weight: bold;">Whole Sell Price:</label>
	                            <input class="form-control" id="wholesell_price" type="number" name="wholesell_price" placeholder="Write product whole sell price" value="{{ $product->wholesell_price }}" readonly>
	                        </div>
	                        <div class="col-md-6 mb-4">
	                          	<label for="wholesell_minimum_qty" class="col-form-label" style="font-weight: bold;">Whole Sell Minimum Quantity:</label>
	                            <input class="form-control" id="wholesell_minimum_qty" type="number" name="wholesell_minimum_qty" placeholder="Write product whole sell qty" value="{{ $product->wholesell_minimum_qty }}" readonly>
	                        </div>
		        		</div>
		        		<!-- Row //-->
		        		<div class="row">
	                        <div class="col-md-4 mb-4">
	                          	<label for="discount_price" class="col-form-label" style="font-weight: bold;">Discount Price:</label>
	                            <input class="form-control" id="discount_price" type="number" name="discount_price" value="{{ $product->discount_price }}" min="0" placeholder="Write product discount price" readonly>
	                        </div>
	                        <div class="col-md-4 mb-4">
	                         	<label for="discount_type" class="col-form-label" style="font-weight: bold;">Discount Type:</label>
				                <div class="custom_select">
                                    <select class="form-control select-active w-100 form-select select-nice" name="discount_type" id="discount_type" disabled>
					                	<option value="1" <?php if ($product->discount_type == '1') echo "selected"; ?>>Flat</option>
	                            		<option value="2" <?php if ($product->discount_type == '2') echo "selected"; ?>>Parcent %</option>
                                    </select>
                                </div>
	                        </div>
							<div class="col-md-4 mb-4">
								<label for="stock_qty" class="col-form-label" style="font-weight: bold;">Stock Quantity:</label>
								<input class="form-control" id="stock_qty" type="number" name="stock_qty" value="{{ $product->stock_qty }}" min="0" placeholder="Write product stock qty" readonly>
							</div>

							<!-- Product Attribute Price combination Starts -->
							<div class="col-12 mt-2 mb-2" id="variation_wrapper">
								<label for="" class="col-form-label" style="font-weight: bold;">Price Variation:</label>
								<input type="hidden" id="is_variation_changed" name="is_variation_changed" value="0">
								<table class="table table-active table-success table-bordered" id="combination_table">
									<thead>
										<tr>
											<th>Variant</th>
											<th>Price</th>
											<th>SKU</th>
											<th>Quantity</th>
											<th>Photo</th>
										</tr>
									</thead>
									<tbody>
										@foreach($product->stocks as $stock)
											<tr>
												<td>{{ $stock->varient }}<input type="hidden" name="{{ $stock->id }}_variant" class="form-control" value="{{ $stock->varient }}" required></td>
												<td><input type="text" name="{{ $stock->id }}_price" class="form-control vdp" value="{{ $stock->price }}" required readonly></td>
												<td><input type="text" name="{{ $stock->id }}_sku" class="form-control" required value="{{ $stock->sku }}" readonly></td>
												<td><input type="text" name="{{ $stock->id }}_qty" class="form-control" value="{{ $stock->qty }}" required readonly></td>
												<td>
													<img src="{{ asset($stock->image) }}" alt="{{ $stock->varient }}-image" style="width: 15%; float: left;">
												</td>
											</tr>
										@endforeach
									</tbody>
								</table>
							</div>
							<!-- Product Attribute Price combination Ends -->
			        	</div>
			        	<!-- Row //-->
		        	</div>
		        </div>
		        <!-- card //-->

		        <div class="card">
		        	<div class="card-header" style="background-color: #fff !important;">
						<h3 style="color: #4f5d77 !important">Description</h3>
					</div>
		        	<div class="card-body">
		        		<div class="row">
		        			<!-- Description Start -->
	                        <div class="col-md-6 mb-4">
	                          	<label for="long_descp_en" class="col-form-label" style="font-weight: bold;">Description (En):</label>
	                            <textarea name="description_en" id="long_descp_en" rows="2" cols="2" class="form-control summernote" placeholder="Write Long Description English" readonly>{{ $product->description_en }}</textarea> 
	                        </div>
	                        <div class="col-md-6 mb-4">
	                          	<label for="long_descp_bn" class="col-form-label" style="font-weight: bold;">Description (Bn):</label>
	                            <textarea readonly name="description_bn" id="long_descp_bn" rows="2" cols="2" class="form-control summernote" placeholder="Write Long Description Bangla">{{ $product->description_bn }}</textarea> 
	                        </div>
	                        <!-- Description End -->
		        		</div>
		        	</div>
		        </div>
		        <!-- card //-->

		        <div class="card">
		        	<div class="card-header" style="background-color: #fff !important;">
						<h3 style="color: #4f5d77 !important">Product Image</h3>
					</div>
		        	<div class="card-body">
	        			<!-- Porduct Image Start -->
                        <div class="mb-4">
                          	<label for="product_thumbnail" class="col-form-label" style="font-weight: bold;">Product Image:</label>
							<img src="{{ asset($product->product_thumbnail) }}" width="100" height="100" class="p-2" id="mainThmb">
						</div><br><br>
						<div class="col-md-12 mb-3">
		                	<div class="box-header mb-3 d-flex">
						        <h4 class="box-title">Product Multiple Image <strong>Update:</strong></h4>
						    </div>
		                	<div class="box bt-3 border-info">
					         	<div class="row row-sm">

						            @foreach($multiImgs as $img)
						            <div class="col-md-3">
						               <div class="card">
						                  <img src="{{ asset($img->photo_name) }}" class="showImage{{$img->id}}" style="height: 130px; width: 280px;">
						               </div>
						            </div>
						            <!--  end col md 3		 -->	
					           		@endforeach
					           		<div class="mb-4">
					           			<div class="row  p-2" id="preview_img">
											
										</div>
			                          	<label for="multiImg" class="col-form-label" style="font-weight: bold;">Add More:</label>
									</div>
					         	</div>
						   </div>
		                </div>
						<!-- Porduct Image End -->
		        		<!-- Checkbox Start -->
                        <div class="mb-4">
                        	<div class="row">
                          		<div class="custom-control custom-switch">
                                    <input type="checkbox" class="form-check-input me-2 cursor" name="is_deals" id="is_deals" {{ $product->is_deals == 1 ? 'checked': '' }} value="1" disabled>
                                    <label class="form-check-label cursor" for="is_deals">Today's Deal</label>
                                </div>
                          	</div>
                          	<div class="row">
                          		<div class="custom-control custom-switch">
                                    <input type="checkbox" class="form-check-input me-2 cursor" name="is_digital" id="is_digital" {{ $product->is_digital == 1 ? 'checked': '' }} value="1" disabled>
                                    <label class="form-check-label cursor" for="is_digital">Digital</label>
                                </div>
                          	</div>
                          	<div class="row">
                          		<div class="custom-control custom-switch">
                                    <input type="checkbox" class="form-check-input me-2 cursor" name="is_featured" id="is_featured" {{ $product->is_featured == 1 ? 'checked': '' }} value="1" disabled>
                                    <label class="form-check-label cursor" for="is_featured">Featured</label>
                                </div>
                          	</div>
                          	<div class="row">
                          		<div class="custom-control custom-switch">
                                    <input type="checkbox" class="form-check-input me-2 cursor" name="status" id="status" {{ $product->status == 1 ? 'checked': '' }} value="1" disabled>
                                    <label class="form-check-label cursor" for="status">Status</label>
                                </div>
                          	</div>
                        </div>
                        <!-- Checkbox End -->
		        	</div>
		        </div>
		</div>
	</div>
</section>
@endsection