<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ShortUrl;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class ShortUrlController extends Controller
{
    public function shorten(Request $request)
    {
        // shorten the url saving it in the database and return the url
        try {
            $request->validate([
                'original_url' => 'required|url'
            ]);
        
            do {
                $shortCode = Str::random(6);
            } while (ShortUrl::where('short_code', $shortCode)->exists());

            $user = Auth::user();

            $shortUrl = ShortUrl::create([
                'original_url' => $request->original_url,
                'short_code' => $shortCode,
                'user_email' => $user->email
            ]);
        
            return response()->json([
                'short_url' => $shortUrl
            ]);
        }catch (\Exception $e) {
            Log::error('Error al acortar la URL: ' . $e->getMessage());
            return response()->json(['error' => 'Error al acortar la URL'], 500);
        }
    }

    public function redirect($shortCode)
    {
        // redirect the user to the original url
        $shortUrl = ShortUrl::where('short_code', $shortCode)->firstOrFail();

        $shortUrl->increment('clicks');
        
        return redirect($shortUrl->original_url);
    }

    public function delete($id)
    {
        // delete the url from the database
        $user = Auth::user();
        $shortUrl = ShortUrl::where('id', $id)->where('user_email', $user->email)->first();

        if (!$shortUrl) {
            return response()->json(['error' => 'URL no encontrada o no autorizada'], 404);
        }

        $shortUrl->delete();

        return response()->json(['message' => 'URL eliminada con éxito']);
    }
}
