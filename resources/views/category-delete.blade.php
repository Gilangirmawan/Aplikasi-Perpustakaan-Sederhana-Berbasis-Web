@extends('layouts.mainlayout')

@section ('title', 'Delete Category')

@section('content')
    
        <h2>Anda Yakin Ingin Menghapus Kategory {{ $category->name }} ?</h2>
        <div class="mt-5">
            <a href="/category-destroy/{{ $category->slug }}" class="btn btn-danger me-4">Ya</a>
            <a href="/categories" class="btn btn-info">Batal</a>
        </div>

@endsection