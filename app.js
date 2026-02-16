import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ActivityIndicator } from 'react-native';

export default function App() {
  const [data, setData] = useState(null);
  const parentPhone = "9876543210"; // Usually from Login

  useEffect(() => {
    // Replace with your Render URL after deployment
    fetch(`https://your-app-name.onrender.com/api/ward-details/${parentPhone}`)
      .then(res => res.json())
      .then(json => setData(json))
      .catch(err => console.error(err));
  }, []);

  if (!data) return <ActivityIndicator style={styles.container} />;

  return (
    <View style={styles.container}>
      <Text style={styles.header}>OPTRA Clone - Parent Portal</Text>
      <View style={styles.card}>
        <Text style={styles.label}>Student Name: {data.name}</Text>
        <Text style={styles.label}>Attendance: {data.attendance}%</Text>
        <Text style={styles.label}>Math Score: {data.marks.math}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', padding: 20, backgroundColor: '#f5f5f5' },
  header: { fontSize: 22, fontWeight: 'bold', marginBottom: 20, textAlign: 'center' },
  card: { padding: 20, backgroundColor: 'white', borderRadius: 10, elevation: 3 }
});
