// presentation/viewmodel/ProfileViewModel.kt
package com.shopapp.presentation.viewmodel

import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.shopapp.domain.model.User
import com.shopapp.domain.repository.AuthRepository
import com.shopapp.domain.repository.UserRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

data class ProfileUiState(
    val profile:     User?    = null,
    val isLoading:   Boolean  = false,
    val isUploading: Boolean  = false,
    val error:       String?  = null,
    val avatarUrl:   String?  = null,
)

@HiltViewModel
class ProfileViewModel @Inject constructor(
    private val repository:     UserRepository,
    private val authRepository: AuthRepository,
) : ViewModel() {

    private val _state = MutableStateFlow(ProfileUiState())
    val state: StateFlow<ProfileUiState> = _state.asStateFlow()

    private val _snackbar = MutableSharedFlow<String>(extraBufferCapacity = 1)
    val snackbar: SharedFlow<String> = _snackbar.asSharedFlow()

    init { loadProfile() }

    fun loadProfile() {
        viewModelScope.launch {
            _state.update { it.copy(isLoading = true, error = null) }

            // is_staff confiable: viene del login y se guarda en TokenDataStore.
            // El endpoint /api/users/profile/ no incluye is_staff, así que lo
            // combinamos aquí para que el botón "Enviar notificación" funcione.
            val storedUser = authRepository.getStoredUser()

            repository.getProfile()
                .onSuccess { profile ->
                    val merged = profile.copy(
                        isStaff = storedUser?.isStaff ?: profile.isStaff,
                    )
                    _state.update {
                        it.copy(
                            profile   = merged,
                            avatarUrl = merged.avatarUrl,
                            isLoading = false,
                        )
                    }
                }
                .onFailure { e ->
                    _state.update { it.copy(isLoading = false, error = e.message) }
                }
        }
    }

    fun uploadAvatar(uri: Uri) {
        if (_state.value.isUploading) return
        viewModelScope.launch {
            _state.update { it.copy(isUploading = true) }
            repository.uploadAvatar(uri)
                .onSuccess { url ->
                    _state.update { it.copy(isUploading = false, avatarUrl = url) }
                    _snackbar.tryEmit("Avatar actualizado correctamente")
                }
                .onFailure { e ->
                    _state.update { it.copy(isUploading = false) }
                    _snackbar.tryEmit("Error al subir el avatar: ${e.message ?: "desconocido"}")
                }
        }
    }
}