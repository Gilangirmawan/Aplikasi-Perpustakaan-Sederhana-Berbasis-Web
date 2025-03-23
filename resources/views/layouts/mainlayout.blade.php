<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Peminjaman Buku | @yield('title')</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

</head>


<body>
    
    <div class="main d-flex flex-column justify-content-between">
        <nav class="navbar navbar-dark navbar-expand-lg bg-secondary">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Sistem Peminjaman Buku</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            </div>
          </nav>

          <div class="body-content h-100">
            <div class="row g-0 h-100">
                <div class="sidebar col-lg-2 collapse d-lg-block" id="navbarSupportedContent">
                  @if (Auth::user())
                                          
                          @if (Auth::user()->role_id == 1)
                                  <a href="/dashboard" @if(request()->route()->uri == 'dashboard') class='active' @endif>Dashboard</a>
                                  <a href="/books"@if(request()->route()->uri == 'books' || request()->route()->uri == 'book-add' || request()->route()->uri == 'book-deleted' || request()->route()->uri == 'book-edit/{slug}' || request()->route()->uri == 'book-delete/{slug}' ) class='active' @endif>Buku</a>
                                  <a href="/categories" @if(request()->route()->uri == 'categories' || request()->route()->uri == 'category-add' || request()->route()->uri == 'category-deleted' || request()->route()->uri == 'category-edit/{slug}' || request()->route()->uri == 'category-delete/{slug}') class='active' @endif>Kategori</a>
                                  <a href="/users" @if(request()->route()->uri == 'users' || request()->route()->uri == 'registered-users' || request()->route()->uri == 'view-banned-users' || request()->route()->uri == 'user-detail/{slug}' || request()->route()->uri == 'user-ban/{slug}' || request()->route()->uri == 'user-banned') class='active' @endif>User</a>
                                  <a href="/rent-logs" @if(request()->route()->uri == 'rent-logs') class='active' @endif>Riwayat Peminjaman</a>
                                  <a href="/" @if(request()->route()->uri == '/') class='active' @endif>Katalog Buku</a>
                                  <a href="/book-rent" @if(request()->route()->uri == 'book-rent') class='active' @endif>Peminjaman Buku</a>
                                  <a href="/book-return" @if(request()->route()->uri == 'book-return') class='active' @endif>Pengembalian Buku</a>
                                  <a href="/logout">Logout</a>
                          @else 
                              <a href="/profile" @if(request()->route()->uri == 'profile') class='active' @endif>Profile</a>
                              <a href="/" @if(request()->route()->uri == '/') class='active' @endif>Daftar Buku</a>
                              <a href="/logout">Logout</a>
                          @endif
                    @else
                    <a href="/login">Login</a>
                  @endif
                    
                </div>
                <div class="content p-5 col-lg-10">
                    @yield('content')
                </div>
            </div>
          </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>