@extends('dealer.dealer_master')
@section('dealer')

<style type="text/css">
    table, tbody, tfoot, thead, tr, th, td{
        border: 1px solid #dee2e6 !important;
    }
    th{
        font-weight: bolder !important;
    }
</style>
<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Order detail</h2>
            <p>Details for Order ID: {{ $order->invoice_no?? ''}}</p>
        </div>
    </div>
    <div class="card">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-4 mb-lg-0 mb-15">
                    <span class="text-white"> <i class="material-icons md-calendar_today"></i> <b>{{ $order->created_at?? ''}}</b> </span> <br />
                    <small class="text-white">Order ID: {{ $order->invoice_no?? ''}}</small>
                </div>
                @php
                    $payment_status = $order->payment_status;
                    $delivery_status = $order->delivery_status;
                @endphp
                <div class="col-lg-8 col-md-8 ms-auto text-md-end">
                    <div class="text-white">Payment Status: @if ($payment_status == '0') Unpaid @else Unpaid @endif</div>
                    <div class="text-white">Delivery Status: {{$delivery_status}}</div>
                </div>
            </div>
        </header>
        <!-- card-header end// -->
        <div class="card-body">
            <div class="row mb-50 mt-20 order-info-wrap">
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-person"></i>
                        </span>
                       
                        <div class="text">
                            <h6 class="mb-1">Customer</h6>
                            <p class="mb-1">
                                {{ $order->name ?? ''}} <br />
                                {{ $order->email ?? ''}} <br />
                                {{ $order->phone ?? ''}}
                            </p>
                            <a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop1{{ $order->id }}">Edit Customer</a>
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-local_shipping"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Order info</h6>
                            <p class="mb-1">
                                Order Id: {{ $order->invoice_no?? ''}} </br>
                                Shipping: {{$order->shipping_name ?? ''}} <br />
                                Pay method: @if($order->payment_method == 'cod') Cash On Delivery @else {{ $order->payment_method }} @endif <br />
                                Status: @php
                                            $status = $order->delivery_status;
                                            if($order->delivery_status == 'cancelled') {
                                                $status = 'Received';
                                            }

                                        @endphp
                                        {!! $status !!}
                            </p>
                            {{-- <a href="#">Download info</a> --}}
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-place"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Deliver to</h6>
                            <p class="mb-1">
                                <Address>
                                    {{$order->address}}
                                </Address>
                                City: {{ ucwords($order->upazilla->name_en ?? '' ) }}, <br />{{ ucwords($order->district->district_name_en ?? '') }},<br />
                                {{ ucwords($order->division->division_name_en ?? '') }}
                            </p>
                        </div>
                    </article>
                </div>
                <!-- col// -->
                <div class="col-md-12 mt-40">
                    <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <th>Invoice</th>
                                    <td>{{ $order->invoice_no?? ''}}</td>
                                    <th>Email</th>
                                    <td><input type="" class="form-control" name="email" value="{{ $order->email ?? 'Null'}}"></td>
                                </tr>
                                <tr>
                                    <th class="col-2">Shipping Address</th>
                                    <td>
                                        <label for="division_id" class="fw-bold text-black"><span class="text-danger">*</span> Division</label>
                                        <select class="form-control select-active"  name="division_id" id="division_id" required>
                                            <option value="">Select Division</option>

                                            @foreach(get_divisions($order->division_id) as $division)
                                              <option value="{{ $division->id }}" {{ $division->id == $order->division_id ? 'selected': '' }}>{{ ucwords($division->division_name_en) }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <label for="district_id" class="fw-bold text-black"><span class="text-danger">*</span> District</label>
                                        <select class="form-control select-active" name="district_id" id="district_id" required>
                                            <option selected=""  value="">Select District</option>
                                            @foreach(get_district_by_division_id($order->division_id) as $district)
                                                <option value="{{ $district->id }}" {{ $district->id == $order->district_id ? 'selected': '' }}>{{ ucwords($district->district_name_en) }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <label for="upazilla_id" class="fw-bold text-black"><span class="text-danger">*</span> Upazilla</label>
                                        <select class="form-control select-active" name="upazilla_id" id="upazilla_id" required>
                                            <option selected=""  value="">Select Upazilla</option>
                                            @foreach(get_upazilla_by_district_id($order->district_id) as $upazilla)
                                                <option value="{{ $upazilla->id }}" {{ $upazilla->id == $order->upazilla_id ? 'selected': '' }}>{{ ucwords($upazilla->name_en) }}</option>
                                            @endforeach

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Payment Method</th>
                                    <td>
                                        <select class="form-control select-active" name="payment_method" id="payment_method" required>
                                            <option selected=""  value="" >Select Payment Method</option>
                                            <option value="cod" @if($order->payment_method == 'cod') selected @endif>Cash</option>
                                            <option value="bikash" @if($order->payment_method == 'bikash') selected @endif>Bikash</option>
                                            <option value="nagad" @if($order->payment_method == 'nagad') selected @endif>Nagad</option>
                                        </select>
                                    </td>
                                    <th>Shipping Charge</th>
                                    <td><input type="" class="form-control" id="cartSubTotalShi" name="shipping_charge" value="{{ $order->shipping_charge}}"></td>
                                </tr>
                                <tr>
                                    <th>Discount</th>
                                    <td><input type="" class="form-control" name="discount" value="{{ $order->discount }}"></td>

                                    <th>Payment Status</th>
                                    <td>
                                        @php
                                            $status = $order->delivery_status;
                                            if($order->delivery_status == 'cancelled') {
                                                $status = 'Received';
                                            }
                                        @endphp
                                        <span class="badge rounded-pill alert-success text-success">{!! $status !!}</span>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <th>Payment Date</th>
                                    <td>{{ date_format($order->created_at,"Y/m/d")}}</td>
                                </tr>
                                <tr>
                                    <th>Sub Total</th>
                                    <td>{{ $order->sub_total }} <strong>Tk</strong></td>
                                    
                                    <th>Total</th>
                                    <td>{{ $order->grand_total }} <strong>Tk</strong></td>
                                </tr>
                            </tbody>
                    </table>
                </div>
                <!-- col// -->
            </div>
            <!-- row // -->
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product Image</th>
                                    <th>Product</th>
                                    <th >Variant</th>
                                    <th >Unit Price</th>
                                    <th >Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($order->order_details as $key => $dealer_request_product)
                                    @if($dealer_request_product->is_varient == 1)
                                        @php
                                            $product_variant = App\Models\ProductStock::where('id',$dealer_request_product->product_stock_id)->first();
                                        @endphp
                                    @endif
                                    <tr>
                                        <td>
                                            <a class="itemside" href="#">
                                                <div class="left">
                                                    @if($dealer_request_product->is_varient == 0)
                                                        <img src="{{ asset($dealer_request_product->product->product_thumbnail ?? ' ') }}" width="40" height="40" class="img-xs" alt="Item">
                                                    @else
                                                        <img src="{{ asset($product_variant->image ?? '') }}" width="40" height="40" class="img-xs" alt="Item">
                                                    @endif
                                                </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="itemside" href="#">
                                                <div class="info">
                                                    <span class="text-bold">
                                                        {{$dealer_request_product->product->name_en ?? ' '}}
                                                    </span>
                                                </div>
                                            </a>
                                        </td>
                                        <td> @if($dealer_request_product->is_varient == 0) - @else{{ $product_variant->varient}} @endif</td>
                                        <td>{{ $dealer_request_product->price ?? '0.00' }}</td>
                                        <td>{{ $dealer_request_product->qty ?? '0' }}</td>
                                        <td>{{ $dealer_request_product->price*$dealer_request_product->qty ?? '0.00' }}</td>
                                    </tr>
                                    <input type="hidden" name="dealer_request_id" value="{{$dealer_request_product->dealer_request_id}}">
                                @endforeach
                                <tr>
                                    <td colspan="4">
                                        <article class="float-end">
                                            <dl class="dlist">
                                                <dt>Subtotal:</dt>
                                                <dd>{{ $order->sub_total ?? '0.00' }}</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Shipping cost:</dt>
                                                <dd>{{ $order->shipping_charge }}</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Discount:</dt>
                                                <dd><b class="">{{ $order->discount }}</b></dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Grand total:</dt>
                                                <dd><b class="h5">{{ $order->grand_total }}</b></dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt class="text-muted">Status:</dt>
                                                <dd>
                                                    @php
                                                        $status = $order->delivery_status;
                                                        if($order->delivery_status == 'cancelled') {
                                                            $status = 'Received';
                                                        }

                                                    @endphp
                                                    <span class="badge rounded-pill alert-success text-success">{!! $status !!}</span>
                                                </dd>
                                            </dl>
                                        </article>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- table-responsive// -->
                </div>
                <!-- col// -->
                <div class="col-lg-1"></div>
                <!-- col// -->
            </div>
        </div>
        <!-- card-body end// -->
    </div>
    <!-- card end// -->
</section>
@endsection
@push('footer-script')

@endpush