<aside class="col-lg-3 border-end">
    <nav class="nav nav-pills flex-lg-column mb-4">
        <a class="nav-link {{ (Route::current()->getName() == 'vendor.profile')? 'active':'' }}" aria-current="page" href="{{ route('vendor.profile') }}">General</a>
        <a class="nav-link {{ (Route::current()->getName() == 'vendor.edit.profile')? 'active':'' }}" href="{{ route('vendor.edit.profile') }}">Edit Profile</a>
        <a class="nav-link {{ (Route::current()->getName() == ' vendor.change.password')? 'active':'' }}" href="{{ route('vendor.change.password') }}">Change Password</a>
    </nav>
</aside>