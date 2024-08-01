<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // check if the user credentials are correct and login the user
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => false
            ]);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => true,
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user
        ]);
    }

    public function logout(Request $request)
    {
        // logout the user and close his session
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }

    public function user(Request $request)
    {
        // return the actual user
        return response()->json($request->user());
    }

    public function checkStatus(){
        // check the estatus of the server an the database
        $user = User::where('email', 'alvaro@gmail.com')->first();

        if($user){
            return response()->json([
                'status' => 'ok'     
            ]);
        }else{
            return response()->json([
                'status' => 'ko'     
            ]);
        }
    }
}
