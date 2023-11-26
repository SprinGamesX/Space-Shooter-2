amount_current = round(amount_current);
if (!instance_exists(parent)){
	instance_destroy();
}
else send_to_parent();