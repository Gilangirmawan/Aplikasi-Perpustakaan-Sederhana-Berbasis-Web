@extends('layouts.mainlayout')

@section ('title', 'Delete Book')

@section('content')
    
<h2>Anda Yakin Ingin Menghapus Buku {{ $book->title }}?</h2>
<div class="mt-5">
    <a href="/book-destroy/{{ $book->slug }}" class="btn btn-danger me-4">Ya</a>
    <a href="/books" class="btn btn-info">Batal</a>
</div>


@endsection