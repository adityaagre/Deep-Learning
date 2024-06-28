from flask import Flask, render_template, request, jsonify
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

app = Flask(__name__)

# Load the dataset
data = pd.read_csv(r"E:\ML_project\file1.csv")

# Separate features and target variable
y = data['Isfake']
X = data.drop(columns=['Isfake'])

# Standardize the features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Using Logistic regression
# clf = LogisticRegression(random_state=42)
# clf.fit(X_scaled, y)

## Using
from sklearn.ensemble import RandomForestClassifier
RF_object = RandomForestClassifier(random_state=42)
RF_object.fit(X_scaled, y)


# Define route for the index page
@app.route("/")
def index():
    return render_template("index.html")


# Define route for prediction
@app.route("/predict", methods=["POST"])
def predict():
    data = request.json

    # Convert input to array and scale
    input_features = [
        data["userFollowerCount"],
        data["userFollowingCount"],
        data["userBiographyLength"],
        data["userMediaCount"],
        data["userHasProfilPic"],
        data["userIsPrivate"],
        data["usernameDigitCount"],
        data["usernameLength"]
    ]
    input_scaled = scaler.transform([input_features])

    # Make prediction
    prediction = RF_object.predict(input_scaled)[0]
    # result = "Real" if prediction == "Yes" else "Fake"

    return jsonify({"prediction": prediction})


if __name__ == "__main__":
    app.run(debug=True)