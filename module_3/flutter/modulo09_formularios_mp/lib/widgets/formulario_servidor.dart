// lib/widgets/formulario_servidor.dart
import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre  = TextEditingController();
  final _ctrlIp      = TextEditingController();
  final _ctrlPuerto  = TextEditingController(text: '22');
  final _ctrlUsuario = TextEditingController(text: 'root');
  final _ctrlMac = TextEditingController();

  final _focusIp      = FocusNode();
  final _focusPuerto  = FocusNode();
  final _focusUsuario = FocusNode();
  final _focusMac = FocusNode();

  String _so  = 'Ubuntu 24.04';
  String _se  = 'Base de Datos';
  bool   _ssl = true;

  // Expresión regular para validar IPv4
  static final _regexIp = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlPuerto.dispose();
    _ctrlUsuario.dispose();
    _focusIp.dispose();
    _focusPuerto.dispose();
    _focusUsuario.dispose();
    super.dispose();
  }

  void _guardar() {
    // validate() llama al validator de TODOS los TextFormField del Form
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':  _ctrlNombre.text,
      'ip':      _ctrlIp.text,
      'puerto':  _ctrlPuerto.text,
      'usuario': _ctrlUsuario.text,
      'mac':     _ctrlMac.text,
      'se':      _se,
      'so':      _so,
      'ssl':     _ssl.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // ── Nombre del servidor ───────────────────────────────────
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Título del libro',
              hintText:   'Cien Años de Soledad',
              prefixIcon: Icon(Icons.book),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIp.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El título es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Dirección IP ──────────────────────────────────────────
          TextFormField(
            controller:      _ctrlIp,
            focusNode:       _focusIp,
            decoration:      const InputDecoration(
              labelText:  'Autor',
              hintText:   'Gabriel García Márquez',
              prefixIcon: Icon(Icons.person),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPuerto.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El autor es obligatorio';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Puerto SSH ────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlPuerto,
            focusNode:       _focusPuerto,
            decoration:      const InputDecoration(
              labelText:  'Año de edición',
              prefixIcon: Icon(Icons.numbers),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusUsuario.requestFocus(),
            validator: (v) {
              final puerto = int.tryParse(v ?? '');
              if (puerto == null)              return 'Año debe ser un número';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Usuario ───────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlUsuario,
            focusNode:       _focusUsuario,
            decoration:      const InputDecoration(
              labelText:  'Editorial',
              prefixIcon: Icon(Icons.business),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'La editorial es obligatoria' : null,
          ),
          const SizedBox(height: 12),

          // ── Dirección MAC ─────────────────────────────────────────
          TextFormField(
            controller:      _ctrlMac,
            focusNode:       _focusMac,
            decoration:      const InputDecoration(
              labelText:  'Código ISBN',
              prefixIcon: Icon(Icons.barcode_reader),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El código ISBN es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Sistema Operativo — DropdownButtonFormField ────────────
          DropdownButtonFormField<String>(
            value:      _so,
            decoration: const InputDecoration(
              labelText:  'Formato de Edición',
              prefixIcon: Icon(Icons.menu_book),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Tapa Dura', 'Bolsillo', 'Digital',
              'Especial', 'Rústica',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _so = v!),
          ),
          const SizedBox(height: 8),


          DropdownButtonFormField<String>(
            value:      _se,
            decoration: const InputDecoration(
              labelText:  'Categoría Literaria',
              prefixIcon: Icon(Icons.category),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Novela', 'Realismo Mágico', 'Fábula', 'Cuentos', 'Ensayo',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _se = v!),
          ),
          const SizedBox(height: 8),

          // ── SSL — SwitchListTile ──────────────────────────────────
          SwitchListTile(
            title:     const Text('Disponible para Préstamo'),
            subtitle:  const Text('Habilitar reserva pública'),
            value:     _ssl,
            onChanged: (v) => setState(() => _ssl = v),
            secondary: const Icon(Icons.check_circle_outline),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar libro'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}