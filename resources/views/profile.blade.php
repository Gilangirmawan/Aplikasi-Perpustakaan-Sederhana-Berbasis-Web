@extends('layouts.mainlayout')

@section ('title', 'Profile')

@section('content')

    <h1>Riwayat Peminjaman User</h1>
    <div class="mt-5">
        <x-rent-log-table :rentlog='$rent_logs' />
    </div>
    
@endsection