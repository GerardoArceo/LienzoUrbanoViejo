function validacionIS(){ //validacion del inicio de sesion
    val=1;
    
    if (document.formu.usuario.value.length===0){ 
        swal('Error','Tiene que escribir su usuario','error');
        val= 0; 
    }
    
    if(document.formu.usuario.value.length>20){
        swal('Error','Sobrepasaste el límite de 20 caracteres en el usuario','error');
        val= 0; 
    }
    
    if (document.formu.pass.value.length===0){ 
        swal('Error','Tiene que escribir su contraseña','error');
        val= 0; 
    }
    
    if(document.formu.pass.value.length>30){
        swal('Error','Sobrepasaste el límite de 30 caracteres en la contraseña','error');
        val= 0; 
    }
    
    if(val===1){
        document.formu.submit();
    }
}

function validacionNA(){ //validacion de nuevo arte
    val=1;
    
    if (document.formu.nombreArte.value.length===0){ 
        swal('Error','Tiene que escribir el nombre de su obra','error');
        val= 0; 
    }
    
    if(document.formu.nombreArte.value.length>100){
        swal('Error','Sobrepasaste el límite de 100 caracteres en el nombre de la obra','error');
        val= 0; 
    }
    
    if(val===1){
        document.formu.submit();
    }
}

function validacionRU(){ //validacion del registro de usuarios
    val=1;
    
    if (document.formu.nombre.value.length===0){ 
        swal('Error','Tiene que escribir su nombre','error');
        val= 0; 
    }
    
    if(document.formu.nombre.value.length>30){
        swal('Error','Sobrepasaste el límite de 30 caracteres en el nombre','error');
        val= 0; 
    }
    
    if (document.formu.aPaterno.value.length===0){ 
        swal('Error','Tiene que escribir su apellido Paterno','error');
        val= 0; 
    }
    
    if(document.formu.aPaterno.value.length>30){
        swal('Error','Sobrepasaste el límite de 30 caracteres en el apellido Paterno','error');
        val= 0; 
    }
    
    if (document.formu.aMaterno.value.length===0){ 
        swal('Error','Tiene que escribir su apellido Materno','error');
        val= 0; 
    }
    
    if(document.formu.aMaterno.value.length>30){
        swal('Error','Sobrepasaste el límite de 30 caracteres en el apellido Materno','error');
        val= 0; 
    }
    
    if (document.formu.usuario.value.length===0){ 
        swal('Error','Tiene que escribir su usuario','error');
        val= 0; 
    }
    
    if(document.formu.usuario.value.length>20){
        swal('Error','Sobrepasaste el límite de 20 caracteres en el usuario','error');
        val= 0; 
    }
    
    if (document.formu.pass.value.length===0){ 
        swal('Error','Tiene que escribir su contraseña','error');
        val= 0; 
    }
    
    if(document.formu.pass.value.length>30){
        swal('Error','Sobrepasaste el límite de 30 caracteres en la contraseña','error');
        val= 0; 
    }
    
    if(document.formu.ciudad.value.length===0){
        swal('Error','Tienes que seleccionar un estado/entidad','error');
        val= 0; 
    }
    
    if(val===1){
        document.formu.submit();
    }
}

function Redirigir(){ //redirige
    document.red.submit();
}

