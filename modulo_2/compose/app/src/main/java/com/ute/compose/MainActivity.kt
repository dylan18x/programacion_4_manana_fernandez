package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.ute.compose.ui.theme.ComposeTheme
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign

import androidx.compose.material3.MaterialTheme
import com.tuapp.compose.screens.S03ButtonScreen
import com.tuapp.compose.screens.S04LayoutScreen
import com.tuapp.compose.screens.S05ModifierScreen
import com.tuapp.compose.screens.S06EstadoScreen
import com.tuapp.compose.screens.S07StateHoistingScreen
import com.tuapp.compose.screens.S08BienvenidaScreen
import com.ute.compose.ui.material3.Paso01Suma
import com.ute.compose.ui.material3.Paso01TextFieldScreen
import com.ute.compose.ui.material3.Paso02CompraTienda
import com.ute.compose.ui.material3.Paso02Tienda
import com.ute.compose.ui.material3.Paso02_CardScreen
import com.ute.compose.ui.material3.Paso03LazyColumnScreen
import com.ute.compose.ui.material3.Paso04ScaffoldScreen
import com.ute.compose.ui.screens.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada paso:
                //S01_SaludoScreen()
                //S02_TextScreen()
                //S03ButtonScreen()
                //S04LayoutScreen()
                //S05ModifierScreen()
                //S06EstadoScreen()
                //S07StateHoistingScreen()
                //S08BienvenidaScreen()
                // ◀ Componentes Material 3:
                //Paso01TextFieldScreen()
                //Paso01Suma()
                //Paso02Tienda()
                //Paso02_CardScreen()
                //Paso03LazyColumnScreen()
                //Paso04ScaffoldScreen()
                // Paso05_NavBarScreen()
                //Paso06_DialogosScreen()   // ← paso activo


            }
        }
    }
}
