<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Person;
use App\Models\PersonAddress;

class UserController extends Controller
{
    public function show(Request $request)
    {
        $user = Auth::user();
        $person = Person::find($user->person_id);
        $addresses = PersonAddress::where('person_id', $user->person_id)->get();
        $address_details = [];

        foreach ($addresses as $address) {
            $details = [
                'name' => $address->address->name,
                'street1' => $address->address->street1,
                'street2' => $address->address->street2,
                'street3' => $address->address->street3,
                'city' => $address->address->city,
                'postcode' => $address->address->postcode,
                'state' => $address->address->state->name,
                'active_from' => $address->active_from,
                'active_thru' => $address->active_thru,
                'is_primary' => $address->is_primary,
            ];

            array_push($address_details, $details);
        }

        $user_details = [
            'id' => $user->id,
            'name' => $person->name,
            'email' => $user->email,
            'addresses' => $address_details,
        ];

        return response()->json(['user' => $user_details], 200);
    }
}
