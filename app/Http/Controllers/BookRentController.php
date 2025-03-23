<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Book;
use App\Models\User;
use App\Models\RentLogs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class BookRentController extends Controller
{
    public function index()
    {
        $users = User::where('id', '!=', 1 )->where('status', '!=', 'inactive')->get();
        $books = Book::all();
        return view('book-rent', ['users' => $users, 'books' => $books]);
    }

    public function store(Request $request)
    {
        $request['rent_date'] = Carbon::now()->toDateString();
        $request['return_date']= Carbon::now()->addDay('7')->toDateString();
        
        $book = Book::findOrFail($request->book_id)->only('status');

        if ($book['status'] != 'in stock') {
            Session::flash('message', 'This Book Is Currently Borrowed'); 
            Session::flash('alert-class', 'alert-danger'); 
            return redirect('book-rent');


        }
        else{

            $count = RentLogs::where('user_id', $request->user_id)->where('actual_return_date', null)->count();
            if ($count >= 3) {
                Session::flash('message', 'You Have Met Your Book Borrowing Limit'); 
                Session::flash('alert-class', 'alert-danger'); 
                return redirect('book-rent');
            }
            else {
                try {
                    DB::beginTransaction();
                    //process insert to rent logs table
                    RentLogs::create($request->all());
                 
                    //process update book table
                    $book = Book::findOrFail($request->book_id);
                    $book->status = 'not available';
                    $book->save();
                    DB::commit();
        
                    Session::flash('message', 'Book Borrowed Successfully !'); 
                    Session::flash('alert-class', 'alert-success'); 
                    return redirect('book-rent');
        
                    } catch (\Throwable $th) {
                        DB::rollBack();
                        dd($th);
                    }
            }

            
        }
    }

    public function returnBook()
    {
        $users = User::where('id', '!=', 1 )->where('status', '!=', 'inactive')->get();
        $books = Book::all();
        return view('return-book', ['users' => $users, 'books'=> $books ]);
    }

    public function saveReturnBook(Request $request)
    {   
        $rent = RentLogs::where('user_id', $request->user_id)->where('book_id', $request->book_id)->where('actual_return_date', null);
        $renData = $rent->first();
        $countData = $rent->count();

        if ($countData == 1) {
            $renData->actual_return_date = Carbon::now()->toDateString();
            $renData->save();

            // Update the book status to "in stock"
            $book = Book::find($request->book_id);
            if ($book && $book->status === 'not available') {
                $book->status = 'in stock';
                $book->save();
            }

            Session::flash('message', 'Book Return Is Successfully !!!'); 
            Session::flash('alert-class', 'alert-success'); 
            return redirect('book-return');
        }
        else{
            Session::flash('message', 'There Is Error In Process !!!'); 
            Session::flash('alert-class', 'alert-warning'); 
            return redirect('book-return');
        }
    }
}


