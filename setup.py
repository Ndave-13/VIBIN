from setuptools import setup, find_packages

setup(
    name="emotion_project",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "pandas",
        "matplotlib",
        "flask",
        "requests"
    ]
)
