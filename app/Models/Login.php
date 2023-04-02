<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;

class Login extends Model implements AuthenticatableContract
{
    use Authenticatable;

    protected $table = 'login';
    protected $primaryKey = 'person_id';

    public $timestamps = false;


    public function person()
    {
        return $this->belongsTo(Person::class);
    }

    protected $fillable = [
        'person_id', 'email', 'pass', 'active_from', 'active_thru', 'is_primary'
    ];
}
