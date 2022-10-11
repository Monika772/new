<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if ( !Schema::hasTable('users') ) {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->Integer('role_id')->nullable();
            $table->string('name');
            $table->string('email',255)->nullable();
            $table->string('mobile')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('profile_image')->nullable();
            $table->enum('status',['active','inactive','deleted'])->default('active');
            $table->enum('mobile_verify_status',['0','1'])->default('0')->comment("0- not verified, 1 - for vreified");
            $table->string('otp')->nullable();
            $table->text('access_token')->nullable();
            $table->text('device_token')->nullable();
            $table->enum('device_type',['android','ios'])->nullable();
            $table->text('zipcode')->nullable();
            $table->longtext('latitude')->nullable();
            $table->longtext('longitude')->nullable();
            $table->enum('otp_verify_status',['0','1'])->default('0')->comment("0- not verified, 1 - for vreified");
            $table->rememberToken();
            $table->timestamps();
        });
    }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
