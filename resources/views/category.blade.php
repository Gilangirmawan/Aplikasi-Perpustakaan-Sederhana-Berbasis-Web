@extends('layouts.mainlayout')

@section ('title', 'Category')

@section('content')
    
        <h1>Daftar Kategori</h1>


        <div class="mt-5 d-flex justify-content-end">
                <a href="category-deleted" class="btn btn-secondary me-3">Lihat Data Dihapus</a>
                <a href="category-add" class="btn btn-primary">Tambah Data</a>
        </div>
<div class="mt-5">       
        @if (session('status'))
                <div class="alert alert-success">
        {{ session('status') }}
                </div>
        @endif
</div>

        <div class="my-5">
                <table class="table">
                        <thead>
                                <tr>
                                        <th>No.</th>
                                        <th>Nama</th>
                                        <th>Aksi</th>
                                </tr>
                        </thead>
                        <tbody>
                                @foreach ($categories as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->name }}</td>
                                        <td>
                                                <a href="/category-edit/{{$item->slug}}">Edit</a>
                                                <a href="/category-delete/{{ $item->slug }}">Hapus</a>
                                        </td>
                                    </tr>
                                @endforeach
                        </tbody>
                </table>
        </div>

@endsection