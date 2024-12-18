import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: SingleChildScrollView( 
          child: Column(
            children: [
              //Image.asset('', scale: 5,),
              Text('movies'),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Radio de los bordes
                // color: colors.inversePrimary,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.all(30.0), 
                width: 480.0,
                height: 400,
                child: Form(
                 // key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                     //   controller: emailController,
                        decoration: InputDecoration(labelText: 'Email',
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                       // controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password',
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                              ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   UserLogin credentials = UserLogin(
                            //     email: emailController.text,
                            //     password: passwordController.text,
                            //   );
              
                            //   bool success = await authProvider.login(credentials);
            
                            //   if (success) {
                            //     // Redirigir según el tipo de usuario
                            //     if (authProvider.user?.role == 'admin') {
                            //       Navigator.pushReplacementNamed(context, '/admin_home');
                            //     } else {
                            //       Navigator.pushReplacementNamed(context, '/home');
                            //     }
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(content: Text('Login fallido')),
                            //     );
                            //   }
                            // }
                          },
                          child: const Text('Login'),
                        ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child:const Text('No tienes una cuenta? Regístrate'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}