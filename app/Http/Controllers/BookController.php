<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Http\Request;

class BookController extends Controller
{
    
   public function index()
    {
        $books = Book::all();
        return view('book', ['books' => $books]);
    }

    public function add()
    {
        $categories = Category::all();
        return view('book-add', ['categories'=> $categories]);
    }

    public function store(Request $request)
    {
        //validation book
        $validated = $request->validate([
            'book_code' => 'required|unique:books|max:255',
            'title' => 'required|max:255',
        ]);

            //upload image/file
        $newName = '';
        if($request->file('image')){
            $extension = $request->file('image')->getClientOriginalExtension();
            $newName = $request->title.'-'.now()->timestamp.'.'.$extension;
            $request->file('image')->storeAS('cover', $newName);
        }

        $request['cover'] = $newName;
        $book = Book::create($request->all());
        $book->categories()->sync($request->categories);
        return redirect('books')->with('status', 'Book Added Successfully');
    }

    public function edit($slug) 
    {
        $book = Book::where('slug', $slug)->first();
        $categories = Category::all(); 
        return view('book-edit', ['categories' => $categories,  'book' => $book, ]);
    }

    public function update(Request $request, $slug)
    {
        
        if($request->file('image')){
            $extension = $request->file('image')->getClientOriginalExtension();
            $newName = $request->title.'-'.now()->timestamp.'.'.$extension;
            $request->file('image')->storeAS('cover', $newName);
            $request['cover'] = $newName;
        }

       
        
        $book = Book::where('slug', $slug)->first();
        $book->update($request->all());

        if($request->categories){
            $book->categories()->sync($request->categories);
        }
        
        return redirect('books')->with('status', 'Book Updated Successfully');
    }

    public function delete($slug)
    {
        // Cari buku berdasarkan slug
        $book = Book::where('slug', $slug)->first();

        // Pastikan buku ditemukan
    if (!$book) {
        return redirect('/books')->with('error', 'Book not found');
    }

        // Kirim data buku ke view
        return view('book-delete', ['book' => $book]);
    }

    public function destroy($slug)
    {
        $book = Book::where('slug', $slug)->first();
        $book->delete();
        return redirect('books')->with('status', 'Book Delete Successfully');
    }

    public function deletedBook()
    {
        $deletedBooks = Book::onlyTrashed()->get();
        return view('book-deleted-list', ['deletedBooks' => $deletedBooks]);
    }

    public function restore($slug)
    {
        $book = book::withTrashed()->where('slug', $slug)->first();
        $book->restore();
        return redirect('books')->with('status', 'Book Restored Successfully');
    }
}
