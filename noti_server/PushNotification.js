const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');
// Inicializar el SDK de Firebase Admin
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});


// TODO: pega aquí el token FCM que te dio la app Flutter
const deviceToken = 'ey8fQ2ZLR5iHyQY66uO7ag:APA91bEAL9xvAdqlKNE1jvQhtssVvvR1J9NpdZ4SNJ-peF6jWql-llnO6APnI6wflWp15YvO1OglWzC5fB__bZ1_Uh4KYPBUWgqHsI6ZF-jAWe_m6yya5TQ';
async function sendPush() {
    const message = {
        token: deviceToken,
        notification: {
            title: 'Hola desde Firebase Admin',
            body: 'Este es un mensaje enviado con la API v',
        },
        data: {
            origen: 'node-demo',
            tipo: 'prueba',
        },
    };
    try {
        const response = await admin.messaging().send(message);
        console.log('✅ Mensaje enviado correctamente:', response);
    } catch (error) {
        console.error('❌ Error al enviar mensaje:', error);
    }
}
sendPush();
