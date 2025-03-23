@extends('layouts.mainlayout')

@section ('title', 'Delete User')

@section('content')
    
        <h2>Angka Yakin Ingin Menghapus User {{ $user->username }} ?</h2>
        <div class="mt-5">
            <a href="/user-destroy/{{ $user->slug }}" class="btn btn-danger me-4">Ya</a>
            <a href="/users" class="btn btn-info">Batal</a>
        </div>

@endsection