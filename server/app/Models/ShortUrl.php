<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShortUrl extends Model
{
    use HasFactory;

    protected $fillable = [
        'original_url',
        'short_code',
        'user_email'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_email', 'email');
    }
}
