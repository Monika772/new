<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'first_name' => 'MyLodge',
            'last_name' => 'Admin',
            'email' => 'admin@yopmail.com',
            'password' => Hash::make('123456'),
            'role'=>'admin'
        ]);
    }
}
