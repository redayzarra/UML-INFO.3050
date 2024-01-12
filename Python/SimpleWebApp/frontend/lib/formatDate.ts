export default function formatDate(dateString: string) {
  const months: { [key: string]: string } = {
    January: "01",
    February: "02",
    March: "03",
    April: "04",
    May: "05",
    June: "06",
    July: "07",
    August: "08",
    September: "09",
    October: "10",
    November: "11",
    December: "12",
  };

  let parts = dateString.replace(",", "").split(" ");
  let month = months[parts[0]];
  let day = parts[1].replace(/(th|rd|nd|st)/, "");
  day = day.padStart(2, "0"); // Ensure the day is two digits
  let year = parts[2];

  return `${year}-${month}-${day}`;
}
