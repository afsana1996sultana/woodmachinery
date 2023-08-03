@extends('dealer.dealer_master')
@section('dealer')
@push('css')
<style>
    .table {
        margin-bottom: 0.5rem;
    }
    .table > :not(caption) > * > * {
        padding: 0.1rem 0.4rem;
    }
    .product-price {
        font-size: 12px;
    }
    .product-thumb {
        cursor: pointer!important;
    }
    .btn-circle {
        width: 30px;
        height: 30px;
        background-color: #d56666;
        vertical-align: center !important;
        border: none;
        float: right;
        color: #fff;
        border-radius: 50%;
    }
    .material-icons {
        vertical-align: middle !important;
        font-size: 15px !important;
    }

    .select2-container--default .select2-selection--single {
        border-radius: 0px !important;
    }
    .select2-container--default {
        width: 100% !important;
    }
    .flex-grow-1 {
        margin-right: 10px;
    }

    .product_wrapper .card-body {
        padding: 0.4rem 0.4rem;
    }
    .modal-open .modal{
        background: #000000a8 !important;
    }
    .product_stock_out{
        position: absolute;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #2e2f3052;
        font-size: 17px;
        font-weight: 600;
        color: #fff;
        top: 0;
        left: 0;
        cursor: initial;
    }
</style>
@endpush
<section class="content-main">
    <div class="row">
        <div class="col-sm-8">
            <div class="row">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="">
                            <div class="row">
                                <div class="col-sm-3">
                                    <input class="form-control" type="text" name="search_term" id="search_term" placeholder="Search by Name" onkeyup="filter()">
                                </div>
                                <div class="col-sm-3">
                                    <div class="custom_select">
                                        <select name="category_id" id="category_id" class="form-control select-active w-100 form-select select-nice" onchange="filter()">
                                            <option value="">-- Select Category --</option>
                                            @foreach($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name_en }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    {{-- <input class="form-control" type="text" name="search_term_barcode" id="search_term_barcode" placeholder="Search by Barcode" onkeyup="filterByBarcode()"> --}}
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- card-body end// -->
                </div>
            </div>
            <div class="row product_wrapper product-row" id="product_wrapper">
                @foreach($products as $product)
                    @if($product->is_varient)
                        @foreach ($product->stocks as $key => $stock)
                            <div class="col-sm-2 col-xs-6 product-thumb product-row-list" onclick="addToListVariant({{ $product->id }},{{ $stock->id }})">
                                <div class="card mb-4">
                                    <div class="card-body position-relative">
                                        <div class="product-image">
                                            @if($stock->image && $stock->image != '' && $stock->image != 'Null')
                                                <img class="default-img" src="{{ asset($stock->image) }}" alt="">
                                            @else
                                                <img class="default-img" src="{{ asset('upload/no_image.jpg') }}" alt="">
                                            @endif
                                        </div>
                                        <p style="font-size: 10px; font-weight: bold; line-height: 15px; height: 30px;">
                                            <?php $p_name_en =  strip_tags(html_entity_decode($product->name_en))?>
                                            {{ Str::limit($p_name_en, $limit = 30, $end = '. . .') }}
                                        </p>
                                        <input type="hidden" id="pv_{{ $product->id }}" value="{{ $stock->id }}">
                                        <input type="hidden" id="pv_type_{{ $product->id }}" value="1">
                                        <p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                            Size: {{ $stock->varient }}
                                        </p>
                                        <p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                            Stock: {{ $stock->qty }}
                                        </p>
                                        <input type="hidden" id="pv_stock_{{ $product->id }}_{{ $stock->id }}" value="{{ $stock->qty }}">
                                        <div>
                                            <div class="product-price">
                                                <span class="price text-primary">৳{{ $stock->wholesaleprice }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="col-sm-2 col-xs-6 product-thumb product-row-list" onclick="addToList({{ $product->id }})">
                            <div class="card mb-4">
                                <div class="card-body position-relative">
                                    <div class="product-image">
                                        @if($product->product_thumbnail && $product->product_thumbnail != '' && $product->product_thumbnail != 'Null')
                                            <img class="default-img" src="{{ asset($product->product_thumbnail) }}" alt="">
                                        @else
                                            <img class="default-img" src="{{ asset('upload/no_image.jpg') }}" alt="">
                                        @endif
                                    </div>
                                    <p style="font-size: 10px; font-weight: bold; line-height: 15px; height: 30px;">
                                        <?php $p_name_en =  strip_tags(html_entity_decode($product->name_en))?>
                                        {{ Str::limit($p_name_en, $limit = 30, $end = '. . .') }}
                                    </p>
                                    <input type="hidden" id="pv_type_{{ $product->id }}" value="0">
                                    <p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                        Stock: {{ $product->stock_qty }}
                                    </p>
                                    <input type="hidden" id="product_stock_{{ $product->id }}" value="{{ $product->stock_qty }}">
                                    <div>
                                        <div class="product-price">
                                            <span class="price text-primary">৳{{ $product->wholesell_price }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>
            <button class="btn btn-xs d-flex mx-auto my-4" id="seemore">Load More <i class="fi-rs-arrow-small-right"></i></button>
        </div>
        <div class="col-sm-4">
            <div class="card mb-4">
                <div class="card-body">
                    <form action="{{ route('dealer.pos.request.store') }}" method="POST">
                        @csrf
                        <div class="d-flex border-bottom pb-3">
                            <div class="flex-grow-1">
                                <input class="form-control" type="hidden" name="dealer_id" value="{{ Auth::guard('dealer')->user()->id }}">
                                <input class="form-control" type="text" value="{{ Auth::guard('dealer')->user()->name }}" readonly>
                            </div>
                        </div>
                        <div>
                            <div class="row" id="checkout_list">
                                <div class="text-center pt-10 pb-10" id="no_product_text">
                                    <span>No Product Added</span>
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Sub Total</td>
                                        <td style="float: right;" class="my-2"><input type="number" id="subtotal_text" name="subtotal" class="form-control" readonly value="0.00"></td>
                                    </tr>
                                    <tr>
                                        <td>Noted</td>
                                        <td style="float: right;" class="my-2">
                                            <textarea type="text" id="comments" name="comment" class="form-control"></textarea>
                                        </td>
                                    </tr>
                                    <div class="clearfix"></div>
                                    <input type="hidden" id="posProducts">
                                </tbody>
                            </table>
                            <hr>
                            <table class="table">
                                <tbody>
                                    <tr style="font-size: 20px; font-weight: bold">
                                        <td>Total</td>
                                        <td style="float: right;">৳ <span id="total_text">0.00</span></td>
                                        <input type="hidden" id="total" name="grand_total" value="0">
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">

                            </div>
                            <div class="col-sm-6">
                                <input type="submit" class="btn btn-primary" value="Place Order" style="float: right;">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- card-body end// -->
            </div>
        </div>
    </div>
</section>
@endsection

@push('footer-script')

    <script>
        $(document).ready(function() {
            $('body').addClass('aside-mini');
        });

        function addToList(id){
            var pv_type = $('#pv_type_'+id).val();

            if(pv_type==1){
                var pv = $('#pv_'+id).val();
                id = id+'_'+pv;
            }
            //alert(id);
            $.ajax({
                type:'GET',
                url:'/dealer/pos/product/'+id,
                dataType:'json',
                success:function(data){
                    // console.log(data);
                    var posProducts = $('#posProducts').val();

                    if(posProducts){
                        var productIds = posProducts.split(',');
                        //console.log(posProducts);
                        if(productIds.includes('product_'+id)){
                            cart_increase(id);
                            return false;
                        }
                    }

                    // Start Sweertaleart Message
                    const Toast = Swal.mixin({
                        toast:true,
                        position: 'top-end',
                        icon: 'success',
                        showConfirmButton: false,
                        timer: 1200
                    })

                    var price = parseFloat(data.wholesell_price);
                    // console.log(price);
                    // if(parseFloat(data.discount_price) > 0){
                    //     if(data.discount_type == 1){
                    //         price = parseFloat(data.regular_price - data.discount_price);
                    //     }else if(data.discount_type == 2){
                    //         price = parseFloat(data.regular_price - (data.regular_price * data.discount_price / 100));
                    //     }
                    // }

                    var subtotal = parseFloat($('#subtotal_text').val());
                    //console.log(subtotal);
                    var total =  parseFloat($('#total').val());
                    // var pur_sub_total =  parseFloat($('#pur_sub_total').val());

                    subtotal = parseFloat(subtotal + price).toFixed(2);
                    total = parseFloat(total + price).toFixed(2);


                    $('#due_amount').val(subtotal);
                    $('#subtotal_text').val(subtotal);
                    $('#total').val(total);
                    $('#total_text').html(total);

                    $('#no_product_text').html('');

                    if(posProducts){
                        posProducts += ',product_' + id;
                    }else{
                        posProducts = 'product_'+id;
                    }

                    $('#posProducts').val(posProducts);

                    html = `<div id="${data.id}"><ul class="list-group list-group-flush">
                                <li class="list-group-item py-0 pl-2">
                                    <div class="row gutters-5 align-items-center">
                                        <div class="col-1">
                                            <div class="row no-gutters align-items-center flex-column aiz-plus-minus">
                                                <button class="btn btn-default" type="button" data-type="plus" data-field="qty-0" onclick="cart_increase(${data.id})">
                                                    <i class="material-icons md-plus"></i>
                                                </button>
                                                <input type="text" name="qty[]" id="qty${data.id}" readonly class="col border-0 text-center flex-grow-1 fs-16 input-number" placeholder="1" value="1" min="1" max="999" onchange="updateQuantity(0)">
                                                <button class="btn btn-default" type="button" data-type="plus" data-field="qty-0" onclick="cart_decrease(${data.id})">
                                                    <i class="material-icons md-minus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-truncate-2">${data.name_en}</div>`;
                    if(pv_type==1){
                        html +=                        `<div class="text-truncate-2">${data.varient}</div>`;
                    }

                    html +=                       `<input type="hidden" name="product_id[]" value="${data.id}">
                                        </div>
                                        <div class="col-3">
                                            <div class="fs-12 opacity-60">${price} x <span id="itemMultiplyQtyTxt${data.id}">1</span></div>
                                            <div class="fs-15 fw-600" id="itemTotalPriceTxt${data.id}">${price}</div>
                                            <input type="hidden" name="price[]" id="price${data.id}" value="${price}">
                                        </div>
                                        <div class="col-2">
                                            <button type="button" class="btn-circle" onclick="removeItem(${data.id})">
                                                <i class="material-icons md-delete"></i>
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </ul><hr><div>`;
                    $('#checkout_list').append(html);
                }
            });
        } 

        function addToListVariant(id,vid){
            var pid = id;
            var pvid = vid;

            id = id+'_'+vid;
            //console.log(id);
            $.ajax({
                type:'GET',
                url:'/dealer/pos/product/'+id,
                dataType:'json',
                success:function(data){
                    console.log(data);
                    var posProducts = $('#posProducts').val();
                    //console.log(posProducts);
                    if(posProducts){
                        var productIds = posProducts.split(',');
                        //console.log(posProducts);
                        if(productIds.includes('product_'+id)){
                            cart_increase_vid(pid,pvid);
                            return false;
                        }
                    }

                    var price = parseFloat(data.wholesell_price);
                    // if(parseFloat(data.discount_price) > 0){
                    //     if(data.discount_type == 1){
                    //         price = parseFloat(data.regular_price - data.discount_price);
                    //     }else if(data.discount_type == 2){
                    //         price = parseFloat(data.regular_price - (data.regular_price * data.discount_price / 100));
                    //     }
                    // }

                    var subtotal = parseFloat($('#subtotal_text').val());
                    //console.log(subtotal);
                    var total =  parseFloat($('#total').val());

                    subtotal = parseFloat(subtotal + price).toFixed(2);
                    total = parseFloat(total + price).toFixed(2);


                    $('#due_amount').val(subtotal);
                    $('#subtotal_text').val(subtotal);
                    $('#total').val(total);
                    $('#total_text').html(total);

                    $('#no_product_text').html('');

                    if(posProducts){
                        posProducts += ',product_' + id;
                    }else{
                        posProducts = 'product_'+id;
                    }

                    $('#posProducts').val(posProducts);

                    html = `<div id="${data.id}_${vid}"><ul class="list-group list-group-flush">
                                <li class="list-group-item py-0 pl-2">
                                    <div class="row gutters-5 align-items-center">
                                        <div class="col-1">
                                            <div class="row no-gutters align-items-center flex-column aiz-plus-minus">
                                                <button class="btn btn-default" type="button" data-type="plus" data-field="qty-0" onclick="cart_increase_vid(${data.id},${vid})">
                                                    <i class="material-icons md-plus"></i>
                                                </button>
                                                <input type="text" name="qty[]" id="qty${data.id}_${vid}" readonly class="col border-0 text-center flex-grow-1 fs-16 input-number" placeholder="1" value="1" min="1" max="999" onchange="updateQuantity(0)">
                                                <button class="btn btn-default" type="button" data-type="plus" data-field="qty-0" onclick="cart_decrease_vid(${data.id},${vid})">
                                                    <i class="material-icons md-minus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-truncate-2">${data.name_en}</div>`;

                    html +=                        `<div class="text-truncate-2">${data.varient}</div>`;


                    html +=                        `<input type="hidden" name="pv_id[]" value="${vid}">
                    <input type="hidden" name="product_id[]" value="${data.id}">
                                        </div>
                                        <div class="col-3">
                                            <div class="fs-12 opacity-60">${price} x <span id="itemMultiplyQtyTxt${data.id}_${vid}">1</span></div>
                                            <div class="fs-15 fw-600" id="itemTotalPriceTxt${data.id}_${vid}">${price}</div>
                                            <input type="hidden" name="price[]" id="price${data.id}_${vid}" value="${price}">
                                            <input type="hidden" name="product_variant[]" id="pv_id_${vid}" value="${data.varient}">
                                        </div>
                                        <div class="col-2">
                                            <button type="button" class="btn-circle" onclick="removeItem_vid(${data.id},${vid})">
                                                <i class="material-icons md-delete"></i>
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </ul><hr><div>`;
                    $('#checkout_list').append(html);
                }
            });
        }

        function removeItem(id){
            var posProductsInput = $('#posProducts');
            var posProductsValue = posProductsInput.val();
            var posProductsArray = posProductsValue.split(',');
            var index = posProductsArray.indexOf('product_'+id);
            if (index > -1) {
                posProductsArray.splice(index, 1);
            }
            var updatedPosProductsValue = posProductsArray.join(',');
            posProductsInput.val(updatedPosProductsValue);


            var qty = parseInt($('#qty'+id).val());
            var price = parseFloat($('#price'+id).val());

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());
            //alert(price);

            subtotal = parseFloat(subtotal - (price*qty)).toFixed(2);
            total = parseFloat(total - (price*qty)).toFixed(2);

            //alert(subtotal);
            $(document).on("change", "#discount", function() {
                var paid_amount = $('#paid_amount').val();
                var discount_amount = $('#discount').val();
                var due_amount = $('#due_amount').val();
                var total_amount_due = $('#total').val();
                var subtotal_dicount = parseFloat(subtotal - discount_amount).toFixed(2);
                if(paid_amount == 0 || paid_amount == 0.00){
                    $('#due_amount').val(subtotal_dicount);
                    $('#total_text').html(subtotal_dicount);
                    $('#total').val(subtotal_dicount);
                }else{
                    var subtotal_dicount_paid = parseFloat(subtotal_dicount - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_dicount_paid);
                    $('#total_text').html(subtotal_dicount);
                    $('#total').val(subtotal_dicount);
                }
            });

            $(document).on("change", "#paid_amount", function() {
                var discount_amount = $('#discount').val();
                var paid_amount = $('#paid_amount').val();
                if(discount_amount == 0 || discount_amount == 0.00){
                    var subtotal_due = parseFloat(subtotal - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_due);
                }else{
                    var discount_amount = $('#discount').val();
                    var paid_amount = $('#paid_amount').val();
                    var subtotal_due = parseFloat((subtotal - discount_amount) - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_due);
                }
            });


            $('#paid_amount').val(0.00);
            $('#discount').val(0.00);
            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(subtotal);
            $('#total').val(total);

            $('#total_text').html(total);

            $('#'+id).html('');
        }

        function removeItem_vid(id,vid){
            var posProductsInput = $('#posProducts');
            var posProductsValue = posProductsInput.val();
            var posProductsArray = posProductsValue.split(',');
            var index = posProductsArray.indexOf('product_'+id+'_'+vid);
            if (index > -1) {
                posProductsArray.splice(index, 1);
            }
            var updatedPosProductsValue = posProductsArray.join(',');
            posProductsInput.val(updatedPosProductsValue);


            //console.log(id,vid);
            var qty = parseInt($('#qty'+id+'_'+vid).val());
            var price = parseFloat($('#price'+id+'_'+vid).val());

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());

            //alert(price);

            subtotal = parseFloat(subtotal - (price*qty)).toFixed(2);
            total = parseFloat(total - (price*qty)).toFixed(2);

            //alert(subtotal);
            $(document).on("change", "#discount", function() {
                var paid_amount = $('#paid_amount').val();
                var discount_amount = $('#discount').val();
                var due_amount = $('#due_amount').val();
                var total_amount_due = $('#total').val();
                var subtotal_dicount = parseFloat(subtotal - discount_amount).toFixed(2);
                if(paid_amount == 0 || paid_amount == 0.00){
                    $('#due_amount').val(subtotal_dicount);
                    $('#total_text').html(subtotal_dicount);
                    $('#total').val(subtotal_dicount);
                }else{
                    var subtotal_dicount_paid = parseFloat(subtotal_dicount - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_dicount_paid);
                    $('#total_text').html(subtotal_dicount);
                    $('#total').val(subtotal_dicount);
                }
            });

            $(document).on("change", "#paid_amount", function() {
                var discount_amount = $('#discount').val();
                var paid_amount = $('#paid_amount').val();
                if(discount_amount == 0 || discount_amount == 0.00){
                    var subtotal_due = parseFloat(subtotal - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_due);
                }else{
                    var discount_amount = $('#discount').val();
                    var paid_amount = $('#paid_amount').val();
                    var subtotal_due = parseFloat((subtotal - discount_amount) - paid_amount).toFixed(2);
                    $('#due_amount').val(subtotal_due);
                }
            });


            $('#paid_amount').val(0.00);
            $('#discount').val(0.00);
            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(subtotal);
            $('#total').val(total);

            $('#total_text').html(total);

            $('#'+id+'_'+vid).html('');
        }

        function cart_increase(id){
            var qty = parseInt($('#qty'+id).val());
            var p_stock = parseInt($('#product_stock_'+id).val());
            var price = parseFloat($('#price'+id).val());
            $('#qty'+id).val(qty+1);
            $('#itemMultiplyQtyTxt'+id).html(qty+1);

            var totalPrice = price * (qty+1);
            $('#itemTotalPriceTxt'+id).html(totalPrice);

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());
            var due = parseFloat($('#due_amount').val());

            subtotal = subtotal + price;
            total = total + price;
            due = due + price;

            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(due);
            $('#total').val(total);

            $('#total_text').html(total);

        }

        function cart_increase_vid(id,pvid){
            //console.log(pid,pvid);
            var qty = parseInt($('#qty'+id+'_'+pvid).val());
            var pv_stock = parseInt($('#pv_stock_'+id+'_'+pvid).val());
            var price = parseFloat($('#price'+id+'_'+pvid).val());
            $('#qty'+id+'_'+pvid).val(qty+1);
            $('#itemMultiplyQtyTxt'+id+'_'+pvid).html(qty+1);

            var totalPrice = price * (qty+1);
            $('#itemTotalPriceTxt'+id+'_'+pvid).html(totalPrice);

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());
            var due = parseFloat($('#due_amount').val());

            subtotal = subtotal + price;
            total = total + price;
            due = due + price;

            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(due);
            $('#total').val(total);

            $('#total_text').html(total);
        }

        function cart_decrease(id){
            var qty = parseInt($('#qty'+id).val());

            $('#qty'+id).val(qty-1);

            var price = parseFloat($('#price'+id).val());
            $('#itemMultiplyQtyTxt'+id).html(qty-1);

            var totalPrice = price * (qty-1);
            $('#itemTotalPriceTxt'+id).html(totalPrice);

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());

            subtotal = parseFloat(subtotal - price).toFixed(2);
            total = parseFloat(total - price).toFixed(2);

            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(subtotal);
            $('#total').val(total);

            $('#total_text').html(total);

        }
        function cart_decrease_vid(id,pvid){
            var qty = parseInt($('#qty'+id+'_'+pvid).val());

            $('#qty'+id+'_'+pvid).val(qty-1);

            var price = parseFloat($('#price'+id+'_'+pvid).val());
            $('#itemMultiplyQtyTxt'+id+'_'+pvid).html(qty-1);

            var totalPrice = price * (qty-1);
            $('#itemTotalPriceTxt'+id+'_'+pvid).html(totalPrice);

            var subtotal = parseFloat($('#subtotal_text').val());
            var total =  parseFloat($('#total').val());

            subtotal = parseFloat(subtotal - price).toFixed(2);
            total = parseFloat(total - price).toFixed(2);

            $('#subtotal_text').val(subtotal);
            $('#due_amount').val(subtotal);
            $('#total').val(total);

            $('#total_text').html(total);
        }

        $(document).on("keyup", "#discount", function() {
            var subtotal = parseFloat($('#subtotal_text').val());
            var paid_amount = $('#paid_amount').val();
            var discount_amount = $('#discount').val();
            var due_amount = $('#due_amount').val();
            var total_amount_due = $('#total').val();
            if(paid_amount == 0 || paid_amount == 0.00){
                var subtotal_dicount = parseFloat(subtotal - discount_amount).toFixed(2);
                $('#due_amount').val(subtotal_dicount);
                $('#total_text').html(subtotal_dicount);
                $('#total').val(subtotal_dicount);
            }else{
                var subtotal_dicount = parseFloat(subtotal - discount_amount).toFixed(2);
                var subtotal_dicount_paid = parseFloat(subtotal_dicount - paid_amount).toFixed(2);
                $('#due_amount').val(subtotal_dicount_paid);
                $('#total_text').html(subtotal_dicount);
                $('#total').val(subtotal_dicount);
            }
        });

        $(document).on("keyup", "#paid_amount", function() {
            var subtotal = parseFloat($('#subtotal_text').val());
            var discount_amount = $('#discount').val();
            var paid_amount = $('#paid_amount').val();
            if(discount_amount == 0 || discount_amount == 0.00){
                var subtotal_due = parseFloat(subtotal - paid_amount).toFixed(2);
                $('#due_amount').val(subtotal_due);
            }else{
                var discount_amount = $('#discount').val();
                var paid_amount = $('#paid_amount').val();
                var subtotal_due = parseFloat((subtotal - discount_amount) - paid_amount).toFixed(2);
                $('#due_amount').val(subtotal_due);
            }
        });

        function filter() {
            var search_term = $('#search_term').val();
            var search_term_barcode = $('#search_term_barcode').val();
            var category_id = $('#category_id').val();
            var brand_id = $('#brand_id').val();

            var url = '/dealer/pos/get-products?filter=1';
            var search_status = 0;
            if(search_term){
                if (/\S/.test(search_term)) {
                    search_term = search_term.replace(/^\s+/g, '');
                    search_term = search_term.replace(/\s+$/g, '');
                    url += '&search_term='+search_term;
                    search_status = 1;
                }
            }
            if(category_id){
                url += '&category_id='+category_id;
                //alert( category_id );
                search_status = 1;
            }
            if(brand_id){
                url += '&brand_id='+brand_id;
                //alert( brand_id );
                search_status = 1;
            }

            if(search_status == 0){
                url = '/dealer/pos/get-products';
            }

            $.ajax({
                type:'GET',
                url:url,
                dataType:'json',
                success:function(data){
                    //console.log(data);
                    var html = '';
                    if(Object.keys(data).length > 0){
                        $.each(data, function(key,value){
                            //console.log(value);

                            var product_name = value.name_en;
                            product_name = product_name.slice(0, 30) + (product_name.length > 30 ? "..." : "");

                            var price_after_discount = value.wholesell_price;
                            // if(value.discount_type == 1){
                            //     price_after_discount = value.regular_price - value.discount_price;
                            // }else if(value.discount_type == 2){
                            //     price_after_discount = value.regular_price - (value.regular_price * value.discount_price / 100);
                            // }
                            if(value.is_varient == 0){
                                html += `<div class="col-sm-2 col-xs-6 product-thumb" onclick="addToList(${value.product_id})">
                                            <div class="card mb-4">
                                                <div class="card-body position-relative">`;
                                                    if(value.stock_qty <= 0){
                                html  +=                `<div class="product_stock_out">Stock Out</div>`;
                                                    }
                                html  +=            `<div class="product-image">`;
                                                        if(value.product_thumbnail && value.product_thumbnail != '' && value.product_thumbnail != 'Null'){
                                html  +=                    `<img class="default-img" src="/${value.product_thumbnail}" alt="" />`;
                                                        }else{
                                html  +=                     `<img class="default-img" src="/upload/no_image.jpg" alt="" />`;
                                                        }
                                html  +=            `</div>
                                                    <p style="font-size: 10px; font-weight: bold; line-height: 15px; height: 30px;">
                                                        ${product_name}
                                                    </p>
                                                    <div>`;

                                html  +=            `<p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                                        Stock: ${value.stock_qty}
                                                    </p>
                                                    <input type="hidden" id="pv_type_${value.id}" value="0">
                                                    <input type="hidden" id="product_stock_${value.id}" value="${value.stock_qty}">`;
                                html  +=                        `<div class="product-price">
                                                                    <span class="price text-primary">৳ ${price_after_discount}</span>
                                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>`;
                                    }else{
                                html += `<div class="col-sm-2 col-xs-6 product-thumb" onclick="addToListVariant(${value.product_id},${value.id})">
                                            <div class="card mb-4">
                                                <div class="card-body position-relative">`;
                                                    if(value.qty <= 0){
                                html  +=                `<div class="product_stock_out">Stock Out</div>`;
                                                    }
                                html  +=            `<div class="product-image">`;
                                                        if(value.product_thumbnail && value.product_thumbnail != '' && value.product_thumbnail != 'Null'){
                                html  +=                    `<img class="default-img" src="/${value.product_thumbnail}" alt="" />`;
                                                        }else{
                                html  +=                     `<img class="default-img" src="/upload/no_image.jpg" alt="" />`;
                                                        }
                                html  +=            `</div>
                                                    <p style="font-size: 10px; font-weight: bold; line-height: 15px; height: 30px;">
                                                        ${product_name}
                                                    </p>
                                                    <div>`;
                                                        if(value.is_varient == 1){
                                html  +=                    `<p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                                                Size: ${value.varient}
                                                            </p>
                                                            <p style="font-size: 10px; font-weight: bold; line-height: 10px; height: 15px;">
                                                                Stock: ${value.qty}
                                                            </p>
                                                            <input type="hidden" id="pv_${value.product_id}" value="${value.id}">
                                                            <input type="hidden" id="pv_type_${value.product_id}" value="1">
                                                            <input type="hidden" id="pv_stock_${value.product_id}_${value.id}" value="${value.qty}">`;
                                                        }
                                                        if (value.discount_price > 0){
                                                                
                                html  +=                    `<div class="product-price">
                                                                    <del class="old-price">৳ ${value.regular_price }</del>
                                                                    <span class="price text-primary">৳ ${price_after_discount }</span>
                                                                </div>`;
                                                            }else{
                                html  +=                        `<div class="product-price">
                                                                    <span class="price text-primary">৳ ${value.regular_price }</span>
                                                                </div>`;
                                                            }
                                html  +=            `</div>
                                                </div>
                                            </div>
                                        </div>`;
                            }
                        });
                    }else{
                        html = '<div class="text-center"><p>No products found!</p></div>'
                    }
                    $('#product_wrapper').html(html);
                }
            });
        };

        function barcode() {
            var barcode_search_term = $('#barcode_search_term').val();
            $.ajax({
                type:'GET',
                url:'/dealer/pos/barcode-product/'+barcode_search_term,
                dataType:'json',
                success:function(data){
                    //console.log(data);
                    if(data.varient){
                        addToListVariant(data.product_id,data.id);
                    }else{
                        addToList(data.id);
                    }

                    $('#barcode_search_term').val(null);
                }
            });
        }
    </script>
    <script>
        /* ================ Load More Product show ============ */
        $(".product-row .product-row-list").hide();
        $(".product-row .product-row-list").slice(0, 18).show();
        $("#seemore").click(function(){
            $(".product-row .product-row-list:hidden").slice(0, 18).slideDown();
            if ($(".product-row .product-row-list:hidden").length == 0) {
                $("#load").fadeOut('slow');
            }
        });
    </script>
@endpush
