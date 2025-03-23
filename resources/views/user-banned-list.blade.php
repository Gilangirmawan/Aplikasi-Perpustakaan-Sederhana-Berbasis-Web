@extends('layouts.mainlayout')

@section ('title', 'Banned User')

@section('content')
    
        <h1>Daftar User Di Bant</h1>

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
                                        <th>Username</th>
                                        <th>Telephone</th>
                                        <th>Aksi</th>
                                </tr>
                        </thead>
                        <tbody>
                                @foreach ($bannedUsers as $item)
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
                                                <a href="/user-restore/{{ $item->slug }}">Pulihkan</a>
                                        </td>
                                </tr>
                                @endforeach
                        </tbody>
                </table>
        </div>

@endsection