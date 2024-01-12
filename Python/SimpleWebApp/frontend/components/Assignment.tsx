"use client";

import React, { useEffect, useState } from 'react';
import { getAssignment } from "@/actions/getAssignment";

const Assignment = () => {
  const [data, setData] = useState({ timezone: '', current_time: '' });

  useEffect(() => {
    const fetchAssignmentData = async () => {
      try {
        const response = await getAssignment();
        setData({
          timezone: response.timezone || 'Unavailable',
          current_time: response.current_time || 'Unavailable'
        });
      } catch (error) {
        console.error("Error fetching assignment data:", error);
        setData({ timezone: 'Error', current_time: 'Error' });
      }
    };

    fetchAssignmentData();
    const interval = setInterval(fetchAssignmentData, 10000);

    return () => clearInterval(interval);
  }, []);

  return (
    <div className="">
      Hello, the current time in {data.timezone} is {data.current_time}
    </div>
  );
};

export default Assignment;

