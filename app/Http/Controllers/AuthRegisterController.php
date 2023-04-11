<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Models\Login;
use App\Models\Person;
use Hash;
use App\Models\Country;
use App\Models\State;
use App\Models\Address;
use App\Models\PersonAddress;

class AuthRegisterController extends Controller
{
    public function register(Request $request)
    {
        // Validate request data
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:login',
            'password' => 'required|min:6',
            'street1' => 'required',
            'street2' => 'nullable',
            'street3' => 'nullable',
            'city' => 'required',
            'postcode' => 'required',
            'state' => 'required',
            'country' => 'required',
        ]);

        // Create a new person record
        $person = new Person();
        $person->name = $request->input('name');
        $person->save();

        // Create a new person country
        if ($request->country) {
            $Country = new Country();
            $Country->name = $request->input('country');
            $Country->save();
        }

        if ($request->state) {
            $State = new State();
            $State->country_id = $Country->country_id ?? null;
            $State->name = $request->input('state');
            $State->save();
        }

        // Create a new  Address
        $Address = new Address();
        $Address->street1 = $request->input('street1');
        $Address->street2 = $request->input('street2');
        $Address->street3 = $request->input('street3');
        $Address->city = $request->input('city');
        $Address->postcode = $request->input('postcode');
        $Address->state_id = $State->id ?? null;
        $Address->save();

        // Create a new person Address
        $PersonAddress = new PersonAddress();
        $PersonAddress->person_id = $person->id ?? null;
        $PersonAddress->address_id = $Address->id ?? null;
        $PersonAddress->active_from = date('Y-m-d H:i:s');
        $PersonAddress->save();

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
