@extends('layouts.mainlayout')

@section ('title', 'Add Book')

@section('content')

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    
    <h1>Tambah Buku</h1>

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

        <form action="book-add" method="post" enctype="multipart/form-data">
        @csrf
            <div class="mb-3">
                <label for="code" class="form-label">Kode Buku</label>
                <input type="text" name="book_code" id="code" class="form-control" placeholder="Book Code" value="{{ old('book_code') }}">
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">Judul Buku</label>
                <input type="text" name="title" id="title" class="form-control" placeholder="Book Title" value="{{ old('title') }}">
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Gambar</label>
                <input type="file" name="image" class="form-control">
            </div>

            <div class="mb-3">
                <label for="category" class="form-label">Kategori</label>
                <select name="categories[]" id="category" class="form-control select-multiple" multiple>
                    @foreach ($categories as $item)
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mt-3">
                <button class="btn btn-success" type="submit">Simpan</button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.select-multiple').select2();
        });
    </script>

@endsection