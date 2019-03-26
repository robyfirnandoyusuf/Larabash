#!/bin/bash
# Author 	: Roby Firnando Y - ExploreOurBrain , Alcodepedia
# Github 	: http://github.com/robyfirnandoyusuf, http://github.com/exploreourbrain
# Contact 	: http://facebook.com/explore-our-brain
# NB 		: chmod +x larabash.sh, not support windows gayn
cat << "EOF"
  _                    ____            _     
 | |    __ _ _ __ __ _| __ )  __ _ ___| |__  
 | |   / _` | '__/ _` |  _ \ / _` / __| '_ \ 
 | |__| (_| | | | (_| | |_) | (_| \__ \ | | |
 |_____\__,_|_|  \__,_|____/ \__,_|___/_| |_|

   V1.0 ~ Roby Firnando - ExploreOurBrain
EOF

printf '%s\n%s\n'
echo "[1]  Create Controller"
echo "[2]  Create Model"
echo "[3]  Artisan List Route (ALL)"
echo "[4]  Artisan List Route (By METHOD)"
echo "[5]  Artisan List Route (By Name)"
echo "[6]  Artisan Optimize"
echo "[7]  Clear All Cache"
echo "[8]  Composer Dump Autoload"
echo "[9]  Composer Install"
echo "[10] Composer Update"
echo "[11] Artisan Migrate"
echo "[12] Artisan Create Migration"
echo "[13] Artisan Create Migration (with --create)"
echo "[14] Artisan Migrate Force"
echo "[15] Artisan Migrate Rollback"
echo "[16] Artisan Migrate Rollback (By Step)"
echo "[17] Artisan Migrate Reset"
echo "[18] Artisan Migrate Refresh"
echo "[19] Artisan Migrate Refresh Seed"
echo "[20] Artisan Migrate Refresh (By Step)"
echo "[21] Artisan Create Seeder"
echo "[22] Artisan Seeder"
echo "[23] Artisan Seeder (with --class)"
echo "[24] Create View"



printf '%s\n'
read -p "Option : " cmd

create_controller() {
	echo "php artisan make:controller " $name
}

create_model() {
	echo "php artisan make:model " $name
}

create_view(){
	echo "" > "resources/views/$namePath.blade.php"
}

clear_cache(){
	echo "php artisan cache:clear"
}

clear_route(){
	echo "php artisan route:cache"
}

config_cache(){
	echo "php artisan config:cache"
}

clear_view(){
	echo "php artisan view:clear"
}

artisan_optimize(){
	echo "php artisan optimize"
}

route_list(){
	echo "php artisan route:list"
}

route_list_by_method(){
	echo "php artisan route:list --method=" $mtd
}

route_list_by_name(){
	echo "php artisan route:list --name=" $name
}

dump_autoload(){
	echo "composer dump-autoload"
}

composer_update(){
	echo "composer update"
}

composer_install(){
	echo "composer install"
}

artisan_migrate(){
	echo "php artisan migrate"
}

create_migration(){
	echo "php artisan make:migration " $name
}

create_migration_opt_create(){
	echo "php artisan make:migration " $name " --create " $name1
}

migrate_force(){
	echo "php artisan migrate --force"
}

migrate_rollback(){
	echo "php artisan migrate:rollback"
}

migrate_rollback_step(){
	echo "php artisan migrate:rollback --step=" $step
}

migrate_reset(){
	echo "php artisan migrate:reset"
}

migrate_refresh(){
	echo "php artisan migrate:refresh"
}

migrate_refresh_seed(){
	echo "php artisan migrate:refresh --seed"
}

migrate_refresh_step(){
	echo "php artisan migrate:refresh --step=" $step
}

create_seeder(){
	echo "php artisan make:seeder " $name
}

seeder(){
	echo "php artisan db:seed"
}

seeder_class(){
	echo "php artisan db:seed --class=" $class
}


case $cmd in
     1)     
		read -p "Controller Name / Path: " name
	  	$(create_controller)
      	;;
     2)      
		read -p "Model Name / Path: " name
      	$(create_model)
      	;;
     3)
		$(route_list)
		;;
	 4)
		read -p "METHOD (GET/POST/PUT/DELETE): " mtd
		$(route_list_by_method)
		;;
	 5)
		read -p "Name : " name
		$(route_list_by_name)
		;;
	 6)
		$(artisan_optimize)
		;;
     7)
		$(clear_cache)
		$(clear_route)
		$(config_cache)
		$(clear_view)
      	;;
     8)
		$(dump_autoload)
		;;

     9)
		$(composer_install)
		;;
	 10)
		$(composer_update)
		;;
	 11)
		$(artisan_migrate)
		;;
	 12)
		read -p "Migrate Name : " name
		$(create_migration)
		;;
	 13)
		read -p "Migrate Name : " name
		read -p "--create : " name1
		$(create_migration_opt_create)
		;;
	 14)
		$(migrate_force)
		;;
	 15)
		$(migrate_rollback)
		;;
	 16)
		read -p "--step (int): " step
		$(migrate_rollback_step)
		;;
	 17)
		$(migrate_reset)
		;;
	 18)
		$(migrate_refresh)
		;;
	 19)
		$(migrate_refresh_seed)
		;;
	 20)
		read -p "--step (int): " step
		$(migrate_refresh_step)
		;;
	 21)
		read -p "Seeder : " name
		$(create_seeder)
		;;
	 22)
		$(seeder)
		;;
	 23)
		read -p "--class : " class
		$(seeder_class)
		;;
	 24)
		read -p "Name / Path : " namePath
		create_view
		;;
     *)
      	echo 'w0ot ?!'
      	;;
esac
