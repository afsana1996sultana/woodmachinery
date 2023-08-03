@php
  $prefix = Request::route()->getPrefix();
  $route = Route::current()->getName();
@endphp
<aside class="navbar-aside bg-primary" id="offcanvas_aside">
    <div class="aside-top">
        <a href="{{ route('vendor.dashboard') }}" class="brand-wrap">
            @php
                $logo = get_setting('site_footer_logo');
            @endphp
            @if($logo != null)
                <img src="{{ asset(get_setting('site_footer_logo')->value ?? ' ') }}" alt="{{ env('APP_NAME') }}"  style="height: 30px !important; width: 100px !important; min-width: 100px !important;">
            @else
                <img src="{{ asset('upload/no_image.jpg') }}" alt="{{ env('APP_NAME') }}" style="height: 30px !important; width: 80px !important; min-width: 80px !important;">
            @endif
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"><i class="text-white material-icons md-menu_open"></i></button>
        </div>
    </div>
    <nav>
        <ul class="menu-aside">
            <li class="menu-item {{ ($route == 'vendor.dashboard')? 'active':'' }}">
                <a class="menu-link" href="{{ route('vendor.dashboard') }}">
                    <i class="fa-solid fa-house fontawesome_icon_custom"></i>
                    <span class="text">Dashboard</span>
                </a>    
            </li>
            
            <li class="menu-item has-submenu 
                {{ ($prefix == 'vendor/product') || ($prefix == 'vendor/category')|| ($prefix == 'vendor/unit') || ($route == 'attribute.index') || ($prefix == 'vendor/brand') ? 'active' : '' }}
            ">
                <a class="menu-link" href="#">
                    <i class="fa-solid fa-bag-shopping fontawesome_icon_custom"></i>
                    <span class="text">Products</span>
                </a>
                <div class="submenu">
                    <a class="{{ ($route == 'vendor.product.add') ? 'active':'' }}" href="{{ route('vendor.product.add') }}">Product Add</a>
                    <a class="{{ ($route == 'vendor.product.all') ? 'active':'' }}" href="{{ route('vendor.product.all') }}">Products</a>
                    <a class="{{ ($prefix == 'vendor/category') ? 'active':'' }}" href="{{ route('vendor.category.index') }}">Categories</a>
                    <a class="{{ ($route == 'vendor.attribute.index') ? 'active':'' }}" href="{{ route('vendor.attribute.index') }}">Attributes</a>
                    <a class="{{ ($route == 'vendor.unit.index') ? 'active':'' }}" href="{{ route('vendor.unit.index') }}">Unit</a>
                    <a class="{{ ($prefix == 'vendor/brand') ? 'active':'' }}" href="{{ route('vendor.brand.all') }}">Brands</a>
                </div>
            </li>
            
            <li class="menu-item has-submenu {{ ($prefix == 'vendor/supplier')?'active':'' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-stars"></i>
                    <span class="text">Suppliers</span>
                </a>
                <div class="submenu">
                    <a class="{{ ($route == 'vendor.supplier.all') ? 'active':'' }}" href="{{ route('vendor.supplier.all') }}">Supplier List</a>
                    <a class="{{ ($route == 'vendor.supplier.create') ? 'active':'' }}" href="{{ route('vendor.supplier.create') }}">Supplier Add</a>
                </div>
            </li>
            <li class="menu-item has-submenu 
                {{ ($route == 'vendor.stock_report.index')? 'active':'' }}
            ">
                <a class="menu-link" href="#">
                   <i class="icon material-icons md-pie_chart"></i>
                    <span class="text">Report</span>
                </a>
                <div class="submenu">
                    <a class="{{ ($route == 'vendor.stock_report.index') ? 'active':'' }}" href="{{ route('vendor.stock_report.index') }}">Product Stock</a>
                </div>
            </li>
        </ul>
        <hr />
        
        <br />
        <br />
        <div class="sidebar-widgets">
           <div class="copyright text-center m-25">
              <p>
                 <strong class="d-block">Vendor Dashboard</strong> © <script>document.write(new Date().getFullYear())</script> All Rights Reserved
              </p>
           </div>
        </div>
    </nav>
</aside>
