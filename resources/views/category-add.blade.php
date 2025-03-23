@extends('layouts.mainlayout')

@section ('title', 'Add Category')

@section('content')
    
    <h1>Tambah Kategori</h1>

    <div class="mt-5 w-50">
 
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
               @foreach ($errors->all() as $error)
                   <li>{{ $error }}</li>
              @endforeach
              </ul>
        </div>
    @endif

        <form action="category-add" method="post">
        @csrf
            <div>
                <label for="Name" class="form-label">Nama</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="Category Name">
            </div>

            <div class="mt-3">
                <button class="btn btn-success" type="submit">Simpan</button>
            </div>
        </form>
    </div>

@endsection