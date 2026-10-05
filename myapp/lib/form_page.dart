import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalstatusController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactnumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
    ageController.text.trim().isEmpty||
    genderController.text.trim().isEmpty||
    maritalstatusController.text.trim().isEmpty||
    addressController.text.trim().isEmpty||
    contactnumberController.text.trim().isEmpty||
    emailController.text.trim().isEmpty||
    religionController.text.trim().isEmpty||
    skillsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please Fill in all fields')),
      );
      return;
    }
    
    await firestore.collection('biodata').add({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'gender': genderController.text.trim(),
      'maritalStatus': maritalstatusController.text.trim(),
      'address': addressController.text.trim(),
      'contactNumber': contactnumberController.text.trim(),
      'email': emailController.text.trim(),
      'religion': religionController.text.trim(),
      'skills': skillsController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),

  });
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Data Saved successfully'),),);

  nameController.clear();
  ageController.clear();
  genderController.clear();
  maritalstatusController.clear();
  addressController.clear();
  contactnumberController.clear();
  emailController.clear();
  religionController.clear();
  skillsController.clear();
}

@override
void dispose() {
  nameController.dispose();
  ageController.dispose();
  genderController.dispose();
  maritalstatusController.dispose();
  addressController.dispose();
  contactnumberController.dispose();
  emailController.dispose();
  religionController.dispose();
  skillsController.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bio Data Form'),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.wc)
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: maritalstatusController,
              decoration: const InputDecoration(
                labelText: 'Marital Status',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.favorite),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: contactnumberController,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: religionController,
              decoration: const InputDecoration(
                labelText: 'Religion',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_balance),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: skillsController,
              decoration: const InputDecoration(
                labelText: 'Skills',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.build),
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}