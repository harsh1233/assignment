<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\Login;
use App\Models\Person;
use Hash;

class AuthRegisterController extends Controller
{
    public function register(Request $request)
    {
        // Validate request data
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:login',
            'password' => 'required|min:6'
        ]);

        // Create a new person record
        $person = new Person();
        $person->name = $request->input('name');
        $person->save();

        // Create a new login record
        $login = new Login();
        $login->person_id = $person->id;
        $login->email = $request->input('email');
        $login->pass = Hash::make($request->input('password'));
        $login->active_from = date('Y-m-d H:i:s');
        $login->is_primary = 1;
        $login->save();

        return response()->json(['message' => 'User registered successfully'], 201);
    }
}
