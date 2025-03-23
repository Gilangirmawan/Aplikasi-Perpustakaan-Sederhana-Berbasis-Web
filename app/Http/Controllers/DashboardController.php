<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    //function index(Request $request){
   //     $request->session()->flush();
   // }

   public function index()
   {
    $bookCount= Book::count();
    $categoryCount= Category::count();
    $userCount= User::count();
    return view('dashboard', ['book_count' => $bookCount, 'category_count' => $categoryCount, 'user_count' => $userCount]);
   }
}
