importScripts('https://www.gstatic.com/firebasejs/8.3.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.3.0/firebase-messaging.js');
firebase.initializeApp({
    apiKey: "AIzaSyBEYCgL4v16ekUA0msa-yjVjlZoYSwerpM",
    authDomain: "gigrr-admin.firebaseapp.com",
    databaseURL: 'https://gigrr-admin.firebaseio.com',
    projectId: "gigrr-admin",
    storageBucket: "gigrr-admin.appspot.com",
    messagingSenderId: "179505675267",
    appId: "1:179505675267:web:80b0b93e0ed52d1be8a236",
    measurementId: "G-JDXHGQ9SB9",
});
    const messaging = firebase.messaging();
    messaging.setBackgroundMessageHandler(function(payload) {
    console.log(
        "[firebase-messaging-sw.js] Received background message ",
        payload,
    );
        
    const notificationTitle = "Background Message Title";
    const notificationOptions = {
        body: "Background Message body.",
        icon: "/itwonders-web-logo.png",
    };
  
    return self.registration.showNotification(
        notificationTitle,
        notificationOptions,
    );
});