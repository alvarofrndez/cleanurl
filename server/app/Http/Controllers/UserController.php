<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\ShortUrl;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function singin(Request $request) {
        // singin a user to the database checking the data and return the user
        try {
            // validate the data of the user
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8|confirmed',
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            // insert user
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'user' => $user,
                'access_token' => $token,
                'token_type' => 'Bearer',
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error interno del servidor',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    public function getAllUrls()
    {
        // get al the urls of the actual user
        $user = Auth::user();

        $shortUrls = ShortUrl::where('user_email', $user->email)->get();

        return response()->json($shortUrls);
    }

    public function getAllUrlsPaginated()
    {
        // get all of the urls wiht pagination of the actual user
        $user = Auth::user();

        $shortUrls = ShortUrl::where('user_email', $user->email)->paginate(8);

        return response()->json($shortUrls);
    }

}
