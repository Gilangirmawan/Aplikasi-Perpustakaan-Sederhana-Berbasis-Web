@extends('layouts.mainlayout')

@section ('title', 'Users')

@section('content')
    
        <h1>Detail User</h1>

        <div class="my-5 d-flex justify-content-end">
            @if ($user->status == 'inactive')
            <a href="/user-approve/{{ $user->slug }}" class="btn btn-warning">Konfirmasi User</a>
            @endif
        </div>

        <div class="mt-5">       
            @if (session('status'))
                    <div class="alert alert-success">
                {{ session('status') }}
                    </div>
            @endif
        </div>

        <div class="my-5 w-25">
            <div class="mb-3">
                <label for="" class="form-label">Username</label>
                <input type="text" class="form-control" readonly value="{{ $user->username }}">
            </div>
        </div>

        <div class="my-5 w-25">
            <div class="mb-3">
                <label for="" class="form-label">Telephone</label>
                <input type="text" class="form-control" readonly value="{{ $user->phone }}">
            </div>
        </div>

        <div class="my-5 w-25">
            <div class="mb-3">
                <label for="" class="form-label">Alamat</label>
                <textarea name="" id="" cols="30" rows="6" class="form-control" style="resize: none">{{ $user->address }}</textarea>
            </div>
        </div>

        <div class="my-5 w-25">
            <div class="mb-3">
                <label for="" class="form-label">Status</label>
                <input type="text" class="form-control" readonly value="{{ $user->status }}">
            </div>
        </div>

        <div class="mt-5">
            <h2>Riwayat Pemnjaman User</h2>
            <x-rent-log-table :rentlog='$rent_logs' />
        </div>

@endsection