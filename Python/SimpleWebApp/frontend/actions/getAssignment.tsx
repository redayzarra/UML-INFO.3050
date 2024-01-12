interface AssignmentResponse {
  timezone?: string;
  current_time?: string;
  error?: string;
}

export const getAssignment = async (): Promise<AssignmentResponse> => {
  try {
    const response = await fetch("http://localhost:8080/assignment");

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    if (data.status === "error") {
      console.error("ASSIGNMENT", data.message);
      return { error: data.message };
    }

    // Destructure timezone and current_time from the response
    const { timezone, current_time } = data.response;

    // Return these values
    return { timezone, current_time };

  } catch (error) {
    console.error("There was a problem fetching the assignment data", error);

    // Check if error is an instance of Error and handle accordingly
    if (error instanceof Error) {
      return { error: error.message };
    } else {
      return { error: "An unknown error occurred" };
    }
  }
};

