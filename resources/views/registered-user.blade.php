@extends('layouts.mainlayout')

@section ('title', 'Users')

@section('content')
    
        <h1>Daftar User Yang Baru Mendaftar</h1>

        <div class="my-5 d-flex justify-content-end">
                <a href="/users" class="btn btn-primary">Konfirmasi Daftar User</a>
        </div>

        <div class="my-5">
                <table class="table">
                        <thead>
                                <tr>
                                        <th>No.</th>
                                        <th>Username</th>
                                        <th>Telephone</th>
                                        <th>Aksi</th>
                                </tr>
                        </thead>
                        <tbody>
                            @foreach ($registeredUsers as $item)
                            <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $item->username }}</td>
                                    <td>
                                            @if ($item->phone)
                                                    {{ $item->phone }}
                                            @else
                                                    -
                                            @endif
                                    </td>
                                    <td>
                                            <a href="/user-detail/{{ $item->slug }}">Detail</a>
                                    </td>
                            </tr>
                            @endforeach
                        </tbody>
                </table>
        </div>

@endsection