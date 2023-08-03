@extends('admin.admin_master')
@section('admin')

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
            <h2 class="content-title card-title">Request Detail</h2>
        </div>
    </div>
    <form action="{{ route('admin.dealer.order') }}" method="post" target="_blank">
        @csrf
        <div class="card">
            <!-- card-header end// -->
            <div class="card-body">
                <div class="row mb-50 mt-20 order-info-wrap">
                    <div class="col-md-4">
                        <article class="icontext align-items-start">
                            <span class="icon icon-sm rounded-circle bg-primary-light">
                                <i class="text-primary material-icons md-person"></i>
                            </span>
                        
                            <div class="text">
                                <h6 class="mb-1">Dealer</h6>
                                <p class="mb-1">
                                    {{ $dealer->user->name ?? ''}} <br/>
                                    {{ $dealer->user->email ?? ''}} <br/>
                                    {{ $dealer->user->phone ?? ''}}
                                </p>
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
                                <h6 class="mb-1">Request info</h6>
                                <p class="mb-1">
                                    Status: {{ $dealer->delivery_status }}
                                </p>
                            </div>
                        </article>
                    </div>
                    <!-- col// -->
                    <div class="col-md-12 mt-40">
                        <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <th>Delivery Status</th>
                                        <td>
                                            <span class="badge rounded-pill alert-success text-success">{{$dealer->delivery_status}}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Payment Date</th>
                                        <td>{{ date_format($dealer->created_at,"Y/m/d")}}</td>
                                    </tr>
                                    <tr>
                                        <th>Total Amount</th>
                                        <td>{{ $dealer->total_amount }} <strong>Tk</strong></td>
                                    </tr>
                                </tbody>
                        </table>
                    </div>
                    <!-- col// -->
                    <input type="hidden" name="dealer_id" value="{{ $dealer->user->id }}">
                </div>
                <!-- row // -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th><input class="form-check-input" type="checkbox" value="" id="select-all"></th>
                                        <th>Product Image</th>
                                        <th>Product Manufacturing Image</th>
                                        <th>Product</th>
                                        <th >Variant</th>
                                        <th >Unit Price</th>
                                        <th >Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($dealer->dealer_request_products as $key => $dealer_request_product)
                                        @if($dealer_request_product->is_varient == 1)
                                            @php
                                                $product_variant = App\Models\ProductStock::where('id',$dealer_request_product->product_stock_id)->first();
                                            @endphp
                                        @endif
                                        <tr>
                                            <td>
                                                @if($dealer_request_product->request_status == 0)
                                                    @if($dealer_request_product->is_varient == 0)
                                                        @php
                                                            $subtotal = $dealer_request_product->price * $dealer_request_product->qty ?? '0.00';
                                                        @endphp
                                                        <input class="form-check-input" type="checkbox" name="products[]" value="{{$dealer_request_product->id}}|{{$dealer_request_product->product->id}}|{{$dealer_request_product->price}}|{{$dealer_request_product->qty}}|{{$subtotal}}">
                                                    @else
                                                        @php
                                                            $subtotal = $dealer_request_product->price * $dealer_request_product->qty ?? '0.00';
                                                        @endphp
                                                        <input class="form-check-input" type="checkbox" name="products[]" value="{{$dealer_request_product->id}}|{{$dealer_request_product->product->id}}|{{$dealer_request_product->price}}|{{$dealer_request_product->qty}}|{{$subtotal}}|{{$product_variant->id}}">
                                                    @endif
                                                @endif
                                            </td>
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
                                                @if($dealer_request_product->is_varient == 0)
                                                    <div class="left">
                                                        @if($dealer_request_product->is_varient == 0)
                                                            -
                                                        @else
                                                            <img src="{{ asset($product_variant->manufimage ?? '') }}" width="40" height="40" class="img-xs" alt="Item">
                                                        @endif
                                                    </div>
                                                @else
                                                    <a class="itemside" target="_blank" href="{{ route('admin.dealer.menufacturing', ['id' => $dealer_request_product->id, 'dealer' => $dealer->user->id]) }}">
                                                        <div class="left">
                                                            @if($dealer_request_product->is_varient == 0)
                                                                -
                                                            @else
                                                                <img src="{{ asset($product_variant->manufimage ?? '') }}" width="40" height="40" class="img-xs" alt="Item">
                                                            @endif
                                                        </div>
                                                    </a>
                                                @endif
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
                                            <td>{{ $dealer_request_product->variation ?? ' '}}</td>
                                            <td>{{ $dealer_request_product->price ?? '0.00' }}</td>
                                            <td>{{ $dealer_request_product->qty ?? '0' }}</td>
                                            <td>{{ $dealer_request_product->price*$dealer_request_product->qty ?? '0.00' }}</td>
                                        </tr>
                                        <input type="hidden" name="dealer_request_id" value="{{$dealer_request_product->dealer_request_id}}">
                                    @endforeach
                                    <tr>
                                        <td colspan="7">
                                            <article class="float-end">
                                                <dl class="dlist">
                                                    <dt>Total Amount:</dt>
                                                    <dd><b class="h5">{{ $dealer->total_amount }}TK</b></dd>
                                                </dl>
                                            </article>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <article class="float-end">
                                                <dl class="dlist">
                                                    <dt>Note:</dt>
                                                    <dd><textarea rows="2" cols="100" class="form-control" name="comments"></textarea></dd>
                                                </dl>
                                            </article>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- table-responsive// -->
                        <div class="row mb-4 justify-content-sm-end">
                            <div class="col-lg-3 col-md-4 col-sm-5 col-6">
                                <input type="submit" class="btn btn-primary" onClick="refreshPage()" value="Confirm Order">
                            </div>
                        </div>
                    </div>
                    <!-- col// -->
                </div>
            </div>
            <!-- card-body end// -->
        </div>
        <!-- card end// -->
    </form>
</section>
@endsection
@push('footer-script')
    <script>
        $('#select-all').click(function(event) {   
            if(this.checked) {
                // Iterate each checkbox
                $(':checkbox').each(function() {
                    this.checked = true;                        
                });
            } else {
                $(':checkbox').each(function() {
                    this.checked = false;                       
                });
            }
        });
        // function refreshPage(){
        //     window.location.reload();
        // } 
    </script>
@endpush