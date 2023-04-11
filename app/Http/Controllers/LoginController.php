<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Carbon\Carbon;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Models\Login;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        // Validate request data
        $request->validate([
            'email' => 'required|email',
            'pass' => 'required'
        ]);

        // Authenticate the user
        $credentials = $request->only('email', 'pass');
        $user = Login::where('email', $credentials['email'])->first();

        if (!$user || !Hash::check($credentials['pass'], $user->pass)) {
            return response()->json(['error' => 'invalid_credentials'], 400);
        }

        // Generate a new JWT token
        $token = JWTAuth::fromUser($user);

        // Return the JWT token
        return response()->json(compact('token'));
    }


    public function logout(Request $request)
    {
        // Get the user's token from the request
        $token = $request->header('Authorization');

        try {
            // Verify the token and retrieve the user
            $user = JWTAuth::parseToken()->authenticate();

            // Invalidate the user's token
            JWTAuth::invalidate($token);

            // Return a success response
            return response()->json(['message' => 'User logged out successfully']);
        } catch (JWTException $e) {
            // Return an error response if the token could not be invalidated
            return response()->json(['error' => 'could_not_invalidate_token'], 500);
        }
    }
}
