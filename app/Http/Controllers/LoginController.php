<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        // Validate request data
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        // Authenticate the user
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            // Generate an API token for the authenticated user
            $user = Auth::user();
            $token = $user->createToken('authToken')->accessToken;

            return response()->json([
                'access_token' => $token,
                'token_type' => 'Bearer',
                'expires_at' => Carbon::parse(
                    $user->token()->expires_at
                )->toDateTimeString()
            ]);
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json(['message' => 'User logged out successfully']);
    }
}
