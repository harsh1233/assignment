<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Login extends Authenticatable implements JWTSubject
{
    use HasFactory;

    protected $table = 'login';
    protected $primaryKey = 'person_id';

    public $timestamps = false;


    public function person()
    {
        return $this->belongsTo(Person::class);
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    protected $fillable = [
        'person_id', 'email', 'password', 'active_from', 'active_thru', 'is_primary'
    ];
}
