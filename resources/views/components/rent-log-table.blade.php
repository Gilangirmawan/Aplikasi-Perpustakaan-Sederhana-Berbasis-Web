<div>
    <table class="table table-bordered table-striped">
        <thead>
                <tr>
                        <th>No.</th>
                        <th>User</th>
                        <th>Buku</th>
                        <th>Tanggal Pinjam</th>
                        <th>Tanggal Kembali</th>
                        <th>Tanggal Pengembalian Sebenarnya</th>
                </tr>
        </thead>
        <tbody>
                @foreach ($rentlog as $item)
                    <tr class="{{ $item->actual_return_date == null ? '' : ($item->return_date < $item->actual_return_date ? 'table-danger' : 'table-success') }}">
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $item->user->username }}</td>
                        <td>{{ $item->book->title }}</td>
                        <td>{{ $item->rent_date }}</td>
                        <td>{{ $item->return_date }}</td>
                        <td>{{ $item->actual_return_date }}</td>
                        
                    </tr>
                @endforeach
        </tbody>
</table>
</div>